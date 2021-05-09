import SwiftUI

struct ForecastView: View {
    
    @ObservedObject var viewModel: ForecastViewModel
    @State private var showSettings = false
    @AppStorage("location") private var location = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("top"), Color("bottom")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "slider.horizontal.3")
                        .symbol(width: 20, height: 20)
                        .onTapGesture { showSettings = true }
                }
                .padding(.trailing)
                Spacer()
                if let forecast = viewModel.forecast.first {
                    Image(systemName: forecast.icon)
                        .icon(width: 200, height: 200)
                    Text(forecast.temperature)
                        .defaultStyle(size: 64)
                }
                Spacer()
                HStack(spacing: 16) {
                    ForEach(viewModel.forecast.dropFirst(), content: DayForecastView.init)
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
            Alert(title: Text("Alert"), message: Text("Weather refresh failed. Try again later"), dismissButton: .default(Text("Ok")))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForecastView(viewModel: ForecastViewModel(forecastProvider: FakeForecastProvider()))
    }
    
}
