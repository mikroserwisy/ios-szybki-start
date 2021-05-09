import SwiftUI

struct SettingsView: View {
    
    @Binding var isVisible: Bool
    @State private var cityName = ""
    @AppStorage("location") private var location = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { isVisible = false }, label: { closeButton})
            }
            .padding(.top, 6)
            Form {
                Section(header: Text("Place")) {
                    TextField("Enter city name", text: $cityName)
                }
            }
        }
        .onAppear { cityName = location }
        .onDisappear {
            if !cityName.isEmpty {
                location = cityName
            }
        }
    }
    
    private var closeButton: some View {
        Image(systemName: "xmark.circle")
            .symbol(width: 20, height: 20, color: .gray)
            .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 6))
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsView(isVisible: .constant(true))
    }
    
}
