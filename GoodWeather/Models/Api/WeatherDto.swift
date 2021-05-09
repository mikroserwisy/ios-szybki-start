struct WeatherDto: Codable {
    
    let forecast: [ForecastDto]
    
    enum CodingKeys: String, CodingKey {
    
        case forecast = "list"
        
    }
    
}
