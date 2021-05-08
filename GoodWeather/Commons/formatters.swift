//
//  Formatters.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 08/05/2021.
//

import Foundation

func format(date: Double) -> String {
    let dateFormatter =  DateFormatter()
    dateFormatter.dateFormat = "E"
    return dateFormatter.string(from: Date(timeIntervalSince1970: date))
}


func format(temperature: Double) -> String {
    "\(Int(temperature))°"
}

