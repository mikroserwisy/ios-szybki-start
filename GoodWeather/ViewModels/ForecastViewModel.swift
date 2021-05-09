import Foundation

final class ForecastViewModel: ObservableObject {
    
    @Published var forecast: [DayForecastViewModel] = []
    @Published var loadingError = false
    
    private let forecastProvider: ForecastProvider
    private let dateFormatter = DateFormatter()
    private let icons = ["01d": "sun.max.fill", "02d": "cloud.sun.fill", "03d": "cloud.fill", "04d": "smoke.fill", "09d": "cloud.rain.fill", "10d": "cloud.sun.rain.fill", "11d": "cloud.sun.bolt.fill", "13d": "snow", "50d": "cloud.fog.fill"]
    
    init(forecastProvider: ForecastProvider) {
        self.forecastProvider = forecastProvider
        dateFormatter.dateFormat = "E"
        if let cityName = UserDefaults.standard.string(forKey: "location") {
            getWeather(for: cityName)
        }
    }
    
    func getWeather(for city: String) {
        loadingError = false
        forecastProvider.getForecast(for: city, callback: onWeatherResult)
    }
    
    private func onWeatherResult(_ result: Result<[DayForecast], HttpError>) {
        DispatchQueue.main.async { [self] in
            //guard let self = self else { return }
            switch result {
            case .success(let forecastData):
                forecast = toViewModel(data: forecastData)
            case .failure(_):
                loadingError = true
            }
        }
    }
    
    private func toViewModel(data: [DayForecast]) -> [DayForecastViewModel] {
        data.map { entry in
            let date = dateFormatter.string(from: entry.date)
            let temperature = "\(entry.temperature)°"
            let icon = icons[entry.icon] ?? "xmark.circle"
            return DayForecastViewModel(icon: icon, temperature: temperature, date: date)
        }
    }
    
}
