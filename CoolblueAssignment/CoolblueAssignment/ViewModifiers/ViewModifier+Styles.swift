import SwiftUI

// MARK: View modifier styles

extension View {
    func titleStyle(foregroundColor: Color = Color.teal) -> some View {
        modifier(TitleViewModifier(foregroundColor: foregroundColor))
    }
    
    func subtitleStyle() -> some View {
        modifier(SubtitleViewModifier())
    }
    
    func headerStyle() -> some View {
        modifier(HeaderViewModifier())
    }
}
