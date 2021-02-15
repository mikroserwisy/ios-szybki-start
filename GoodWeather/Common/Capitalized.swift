//
//  Capitalized.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

@propertyWrapper struct Capitalized {
    
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.capitalized
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
    
}
