//
//  DayForecastViewModel.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

import Foundation

struct DayForecastViewModel: Identifiable {
    
    let id = UUID()
    let date: String
    let temperature: String
    let icon: String
    
}
