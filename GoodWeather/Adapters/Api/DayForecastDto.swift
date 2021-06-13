struct DayForecastDto: Codable {
    
    let weather: [WeatherDto]
    let temperature: TemperatureDto
    let pressure: Double
    let date: Double
    
    enum CodingKeys: String, CodingKey {

        case weather
        case temperature = "temp"
        case pressure
        case date = "dt"
        
    }
    
}
