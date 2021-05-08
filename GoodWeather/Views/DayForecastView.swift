//
//  DayForecastView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

import SwiftUI

struct DayForecastView: View {
    
    let viewModel: DayForecastViewModel
    
    var body: some View {
        VStack(spacing: 4) {
            Text(viewModel.date)
                .defaultStyle()
            Image(systemName: viewModel.icon)
                .icon()
            Text(viewModel.temperature)
                .defaultStyle()
        }
    }
    
}

struct DayForecastView_Previews: PreviewProvider {
    
    static var previews: some View {
        DayForecastView(viewModel: DayForecastViewModel(date: "Pn.", temperature: "-12°", icon: "sun.max.fill"))
            .preferredColorScheme(.dark)
    }
    
}
