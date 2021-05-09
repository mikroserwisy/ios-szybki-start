import SwiftUI

@main
struct GoodWeatherApp: App {
    
    var body: some Scene {
        WindowGroup {
            ForecastView(viewModel: ForecastViewModel(forecastProvider: URLSessionForecastProvider()))
        }
    }
    
}
