import Foundation

final class URLSessionForecastProvider: ForecastProvider {
    
    private let url = "https://api.openweathermap.org/data/2.5/forecast/daily?cnt=7&units=metric&APPID=b933866e6489f58987b2898c89f542b8&q="
    
    func getForecast(for city: String, callback: @escaping (Result<[DayForecast], HttpError>) -> ()) {
        guard let requestUrl = URL(string: "\(url)\(city)") else {
            callback(.failure(.malformedUrl))
            return
        }
        let request = URLRequest(url: requestUrl)
        URLSession.shared.dataTask(with: request) { responseText, response, error in
            guard let json = responseText else {
                callback(.failure(.requestFailed))
                return
            }
            if let weatherDto = try? JSONDecoder().decode(WeatherDto.self, from: json) {
                let forecast = self.toModel(weatherDto: weatherDto)
                callback(.success(forecast))
            } else {
                callback(.failure(.parsingFailed))
            }
        }.resume()
    }
    
    private func toModel(weatherDto: WeatherDto) -> [DayForecast] {
        weatherDto.forecast.map { forecastDto in
            let icon = forecastDto.description.first?.icon ?? ""
            let temperature = Int(forecastDto.temperature.day)
            let date =  Date(timeIntervalSince1970: forecastDto.date)
            return DayForecast(icon: icon, temperature: temperature, date: date)
        }
    }
    
}
