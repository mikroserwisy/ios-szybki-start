//
//  URLSessionWeatherService.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

import Foundation

final class URLSessionWeatherService: WeatherService {
    
    private let url = "https://api.openweathermap.org/data/2.5/forecast/daily?cnt=7&units=metric&APPID=b933866e6489f58987b2898c89f542b8&q="
    
    func getWeather(for city: String, callback: @escaping (Result<[Forecast], HttpError>) -> ()) {
        guard let requestUrl = URL(string: "\(url)\(city)") else {
            callback(.failure(.malformedUrl))
            return
        }
        let request = URLRequest(url: requestUrl)
        URLSession.shared.dataTask(with: request) { responseText, response, error in
            guard let json = responseText else {
                callback(.failure(.requestFailed))
                return
            }
            if let weather = try? JSONDecoder().decode(Weather.self, from: json) {
                callback(.success(weather.forecast))
            } else {
                callback(.failure(.parsingFailed))
            }
        }.resume()
    }
    
}
