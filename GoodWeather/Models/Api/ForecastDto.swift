struct ForecastDto: Codable {
    
    let description: [DescriptionDto]
    let temperature: TemperatureDto
    let date: Double
    
    enum CodingKeys: String, CodingKey {

        case description = "weather"
        case temperature = "temp"
        case date = "dt"
        
    }
    
}
