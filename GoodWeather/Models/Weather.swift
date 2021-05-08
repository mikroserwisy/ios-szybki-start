//
//  Weather.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

struct Weather: Codable {
    
    let forecast: [Forecast]
    
    enum CodingKeys: String, CodingKey {
    
        case forecast = "list"
        
    }
    
}
