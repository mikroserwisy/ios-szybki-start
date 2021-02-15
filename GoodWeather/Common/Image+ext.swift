//
//  Image+ext.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

import SwiftUI

extension Image {
    
    func iconStyle(width: CGFloat, height: CGFloat) -> some View {
        self.renderingMode(.original)
            .size(width: width, height: width)
    }
    
    func colorIconStyle(width: CGFloat, height: CGFloat, color: Color = .white) -> some View {
        self.renderingMode(.template)
            .size(width: width, height: width)
            .foregroundColor(color)
    }
    
    private func size(width: CGFloat, height: CGFloat) -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
    }
    
}
