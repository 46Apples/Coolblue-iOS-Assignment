import SwiftUI

struct TitleViewModifier: ViewModifier {
    var foregroundColor: Color = Color.teal
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom)
            .foregroundColor(foregroundColor)
            .font(.headline)
    }
}
