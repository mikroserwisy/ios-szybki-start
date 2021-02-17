//
//  ContentView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

import SwiftUI

struct ForecastView: View {
    
    @ObservedObject var viewModel: ForecastViewModel
    @State private var showCity = true
    @State private var showSettings = false
    @AppStorage("location") private var location = ""
    
    var body: some View {
        ZStack {
            GradientView(topColor: .top, bottomColor: .bottom)
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "slider.horizontal.3")
                        .colorIconStyle(width: 20, height: 20)
                        .onTapGesture { showSettings = true }
                }
                .padding(.trailing)
                if showCity {
                    Text(viewModel.city)
                        .defaultStyle(size: 34)
                }
                Spacer()
                Image(systemName: viewModel.icon)
                    .iconStyle(width: 200, height: 200)
                    .onTapGesture(count: 2) { showCity.toggle() }
                Text(viewModel.temperature)
                    .defaultStyle(size: 64)
                Spacer()
                HStack(spacing: 16) {
                    ForEach(viewModel.forecast, content: DayForecastView.init)
                }
                Spacer()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            viewModel.getWeather(for: location)
        }
        //.onAppear { viewModel.getWeather(for: location) }
        .onChange(of: location, perform: viewModel.getWeather(for:))
        .sheet(isPresented: $showSettings) { SettingsView(isVisible: $showSettings) }
        .alert(isPresented: $viewModel.loadingError) {
            Alert(title: Text(LocalizedStringKey("Alert")),
                  message: Text(LocalizedStringKey("Weather refresh failed. Try again later")),
                  dismissButton: .default(Text(LocalizedStringKey("Ok"))))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForecastView(viewModel: ForecastViewModel(weatherService: FakeWeatherService()))
    }
    
}
