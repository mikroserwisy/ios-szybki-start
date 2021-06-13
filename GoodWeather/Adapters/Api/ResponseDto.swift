struct ResponseDto: Codable {
    
    let forecast: [DayForecastDto]
    
    enum CodingKeys: String, CodingKey {
    
        case forecast = "list"
        
    }
    
}
