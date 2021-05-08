//
//  Forecast.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

struct Forecast: Codable {
    
    let description: [Description]
    let temperature: Temperature
    let date: Double
    
    enum CodingKeys: String, CodingKey {

        case description = "weather"
        case temperature = "temp"
        case date = "dt"
        
    }
    
}
