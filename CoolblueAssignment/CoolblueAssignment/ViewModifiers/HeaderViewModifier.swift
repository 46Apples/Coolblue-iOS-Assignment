import SwiftUI

struct HeaderViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding([.top, .bottom])
            .font(.headline)
    }
}
