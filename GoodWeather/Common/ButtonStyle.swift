//
//  ButtonStyle.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 14/02/2021.
//

import SwiftUI

struct DefaultButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.blue.opacity(0.5) : Color.blue)
    }
    
}
