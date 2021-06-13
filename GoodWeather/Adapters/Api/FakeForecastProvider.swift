import Foundation

final class FakeForecastProvider: ForecastProvider {
  
    func getForecast(for city: String, callback: (Result<[DayForecast], HttpError>) -> ()) {
        callback(.success([
            DayForecast(icon: "02d", description: "clear sky", temperature: 13, pressure: 1011, date: Date()),
            DayForecast(icon: "03d", description: "clear sky", temperature: 11, pressure: 1011, date: Date()),
            DayForecast(icon: "04d", description: "clear sky", temperature: 16, pressure: 1011, date: Date()),
            DayForecast(icon: "09d", description: "clear sky", temperature: 12, pressure: 1011, date: Date()),
            DayForecast(icon: "10d", description: "clear sky", temperature: 17, pressure: 1011, date: Date()),
            DayForecast(icon: "11d", description: "clear sky", temperature: 12, pressure: 1011, date: Date()),
            DayForecast(icon: "13d", description: "clear sky", temperature: 15, pressure: 1011, date: Date())
        ]))
    }
    
}
