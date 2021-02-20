//
//  View+ext.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 14/02/2021.
//

import SwiftUI

extension View {
    
    func iOS<Content: View>(_ modifier: (Self) -> Content) -> some View {
        #if os(iOS)
        return modifier(self)
        #else
        return self
        #endif
    }
    
}
