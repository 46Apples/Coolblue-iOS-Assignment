import SwiftUI

// [ProductsErrorView] is a view that informs a user that an error has occurred, such as a network request failure for example, and allow the user to retry the operation.

struct ProductsErrorView: View {
    private let action: () -> Void
    
    // Specify the action to be invoked when the [Retry] button is pressed.
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Text("Oops! Something went wrong")
            .headerStyle()
        
        Button("Retry") {
            action()
        }
        .padding()
    }
}

#Preview {
    ProductsErrorView {
        print("\(#function)")
    }
}
