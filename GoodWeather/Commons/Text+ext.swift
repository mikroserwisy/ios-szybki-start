//
//  Text+ext.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

import SwiftUI

extension Text {
    
    func defaultStyle(size: CGFloat = 18) -> some View {
        font(.system(size: size, weight: .medium))
            .foregroundColor(.white)
            .padding(2)
    }
    
}
