import Foundation

struct DayForecastViewModel: Identifiable {
    
    let id = UUID()
    let icon: String
    let description: String
    let temperature: String
    let pressure: String
    let date: String
    
}
