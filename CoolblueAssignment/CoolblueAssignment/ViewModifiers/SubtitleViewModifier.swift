import SwiftUI

struct SubtitleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline.weight(.light))
    }
}
