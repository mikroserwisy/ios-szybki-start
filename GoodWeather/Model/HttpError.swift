//
//  HttpError.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

enum HttpError: Error {
    
    case requestFailed
    case invalidData
    case malformedUrl
    case parsingFailed
        
}
