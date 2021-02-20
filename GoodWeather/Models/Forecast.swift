//
//  Forecast.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

struct Forecast: Codable {
    
    let pressure: Double
    let humidity: Int
    let description: [Description]
    let temperature: Temperature
    let date: Double
    
    enum CodingKeys: String, CodingKey {
        
        case pressure
        case humidity
        case description = "weather"
        case temperature = "temp"
        case date = "dt"
        
    }
    
}
