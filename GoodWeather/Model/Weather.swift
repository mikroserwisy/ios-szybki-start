//
//  Weather.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

struct Weather: Codable {
    
    let city: City
    let forecast: [Forecast]
    
    enum CodingKeys: String, CodingKey {
        
        case city
        case forecast = "list"
        
    }
    
}
