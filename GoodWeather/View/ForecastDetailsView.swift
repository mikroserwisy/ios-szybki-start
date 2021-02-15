//
//  ForecastDetailsView.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 15/02/2021.
//

import SwiftUI

struct ForecastDetailsView: View {
    
    let viewModel: DayForecastViewModel
   
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
}

struct ForecastDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForecastDetailsView(viewModel: DayForecastViewModel(date: "Pn.", temperature: "-12°", icon: "sun.max.fill"))
    }
    
}
