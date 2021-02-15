//
//  ForecastViewModel.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

import Foundation

final class ForecastViewModel: ObservableObject {
    
    private let weatherService: WeatherService
    
    @Published var city = ""
    @Published var temperature = ""
    @Published var icon = "sun.max.fill"
    @Published var forecast: [DayForecastViewModel] = []
    @Published var loadingError = false
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter =  DateFormatter()
        dateFormatter.locale = Locale(identifier: Locale.preferredLanguages[0])
        dateFormatter.dateFormat = "E"
        return dateFormatter
    }()
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
        if let cityName = UserDefaults.standard.string(forKey: "location") {
            getWeather(for: cityName)
        }
    }
    
    func getWeather(for city: String) {
        loadingError = false
        if city.isEmpty {
            return
        }
        weatherService.getWeather(for: city) { [self] result in
            switch result {
            case .success(let weather):
                mapModel(weather: weather)
            case .failure(_):
                loadingError = true
            }
        }
    }
    
    private func mapModel(weather: Weather) {
        city = weather.city.name
        if let currentForecast = weather.forecast.first, let icon = currentForecast.description.first?.icon {
            temperature = format(temperature: currentForecast.temperature.day)
            self.icon = map(icon: icon)
        }
        forecast = weather.forecast.dropFirst().map(mapModel(forecast:))
    }
    
    private func mapModel(forecast: Forecast) -> DayForecastViewModel {
        let date = dateFormatter.string(from: Date(timeIntervalSince1970: forecast.date))
        let temperature = format(temperature: forecast.temperature.day)
        let icon = map(icon: forecast.description.first?.icon ?? "")
        return DayForecastViewModel(date: date, temperature: temperature, icon: icon)
    }
    
    private func map(icon: String) -> String {
        switch icon {
        case "01d", "01n":
            return "sun.max.fill"
        case "02d", "02n":
            return "cloud.sun.fill"
        case "03d", "03n":
            return "cloud.fill"
        case "04d", "04n":
            return "smoke.fill"
        case "09d", "09n":
            return "cloud.rain.fill"
        case "10d", "10n":
            return "cloud.sun.rain.fill"
        case "11d", "11n":
            return "cloud.sun.bolt.fill"
        case "13d", "13n":
            return "snow"
        case "50d", "50n":
            return "cloud.fog.fill"
        default:
            return "xmark.circle"
        }
    }
    
    private func format(temperature: Double) -> String {
        "\(Int(temperature))°"
    }

}
