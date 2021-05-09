import Foundation

final class FakeForecastProvider: ForecastProvider {
  
    func getForecast(for city: String, callback: (Result<[DayForecast], HttpError>) -> ()) {
        callback(.success([
            DayForecast(icon: "02d", temperature: 13, date: Date()),
            DayForecast(icon: "03d", temperature: 11, date: Date()),
            DayForecast(icon: "04d", temperature: 16, date: Date()),
            DayForecast(icon: "09d", temperature: 12, date: Date()),
            DayForecast(icon: "10d", temperature: 17, date: Date()),
            DayForecast(icon: "11d", temperature: 12, date: Date()),
            DayForecast(icon: "13d", temperature: 15, date: Date())
        ]))
    }
    
}
