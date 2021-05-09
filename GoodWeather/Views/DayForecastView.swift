import SwiftUI

struct DayForecastView: View {
    
    let viewModel: DayForecastViewModel
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: viewModel.icon)
                .icon()
                .padding(.bottom, 4)
            Text(viewModel.temperature)
                .defaultStyle()
            Text(viewModel.date)
                .defaultStyle()
        }
    }
    
}

struct DayForecastView_Previews: PreviewProvider {
    
    static var previews: some View {
        DayForecastView(viewModel: DayForecastViewModel(icon: "sun.max.fill", temperature: "-12°", date: "Pn."))
            .preferredColorScheme(.dark)
    }
    
}
