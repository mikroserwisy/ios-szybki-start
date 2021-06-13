import SwiftUI

extension Text {
    
    func defaultStyle(size: CGFloat = 18) -> some View {
        font(.system(size: size))
            .foregroundColor(.white)
            .padding(2)
    }
    
}
