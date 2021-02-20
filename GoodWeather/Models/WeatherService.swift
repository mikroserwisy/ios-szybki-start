//
//  WeatherService.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

protocol WeatherService {
    
    func getWeather(for city: String, callback: @escaping (Result<Weather, HttpError>) -> ())
    
}
