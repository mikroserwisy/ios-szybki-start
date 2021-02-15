//
//  Description.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

struct Description: Codable {
    
    let text: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
       
        case text = "description"
        case icon
            
    }
    
}
