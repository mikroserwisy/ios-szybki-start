//
//  Image+ext.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

import SwiftUI

extension Image {
    
    func icon(width: CGFloat = 40, height: CGFloat = 40) -> some View {
        renderingMode(.original)
            .size(width: width, height: width)
    }
    
    func symbol(width: CGFloat, height: CGFloat, color: Color = .white) -> some View {
        renderingMode(.template)
            .size(width: width, height: width)
            .foregroundColor(color)
    }
    
    private func size(width: CGFloat, height: CGFloat) -> some View {
        resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
    }
    
}
