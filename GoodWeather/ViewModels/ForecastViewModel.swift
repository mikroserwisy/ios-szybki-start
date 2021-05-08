//
//  ForecastViewModel.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

import Foundation

final class ForecastViewModel: ObservableObject {
    
    @Published var forecast: [DayForecastViewModel] = []
    @Published var loadingError = false
    
    private let weatherService: WeatherService
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
        if let cityName = UserDefaults.standard.string(forKey: "location") {
            getWeather(for: cityName)
        }
    }
    
    func getWeather(for city: String) {
        loadingError = false
        weatherService.getWeather(for: city, callback: onWeatherResult)
    }
    
    private func onWeatherResult(_ result: Result<[Forecast], HttpError>) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            switch result {
            case .success(let forecastData):
                self.forecast = self.map(data: forecastData)
            case .failure(_):
                self.loadingError = true
            }
        }
    }
    
    private func map(data: [Forecast]) -> [DayForecastViewModel] {
        data.map { entry in
            let date = format(date: entry.date)
            let temperature = format(temperature: entry.temperature.day)
            let icon = map(icon: entry.description.first?.icon ?? "")
            return DayForecastViewModel(date: date, temperature: temperature, icon: icon)
        }
    }
    
    private func map(icon: String) -> String {
        switch icon {
        case "01d":
            return "sun.max.fill"
        case "02d":
            return "cloud.sun.fill"
        case "03d":
            return "cloud.fill"
        case "04d":
            return "smoke.fill"
        case "09d":
            return "cloud.rain.fill"
        case "10d":
            return "cloud.sun.rain.fill"
        case "11d":
            return "cloud.sun.bolt.fill"
        case "13d":
            return "snow"
        case "50d":
            return "cloud.fog.fill"
        default:
            return "xmark.circle"
        }
    }
    
}
