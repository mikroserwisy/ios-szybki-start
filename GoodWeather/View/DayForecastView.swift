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
                .defaultStyle(size: 18)
            Image(systemName: viewModel.icon)
                .iconStyle(width: 40, height: 40)
            Text(viewModel.temperature)
                .defaultStyle(size: 18)
        }
    }
    
}

struct DayForecastView_Previews: PreviewProvider {
    
    static var previews: some View {
        DayForecastView(viewModel: DayForecastViewModel(date: "Pn.", temperature: "-12°", icon: "sun.max.fill"))
    }
    
}
