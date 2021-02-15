//
//  SettingsView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isVisible: Bool
    @State private var cityName = ""
    @AppStorage("location") private var location = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { isVisible = false }, label: { closeButton})
            }
            .padding(.top, 6)
            Form {
                Section(header: Text(LocalizedStringKey("Place"))) {
                    TextField(LocalizedStringKey("Enter city name"), text: $cityName)
                }
            }
        }
        .onAppear { cityName = location }
        .onDisappear { location = cityName }
    }
    
    private var closeButton: some View {
        Image(systemName: "xmark.circle")
            .imageScale(.large)
            .frame(width: 40, height: 40)
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsView(isVisible: .constant(true))
    }
    
}
