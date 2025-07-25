import SwiftUI

// [ProductResultsListView] is a view that displays a list of given products in a [List] view type.

struct ProductResultsListView: View {
    var products: [ProductModel]
    
    var body: some View {
        List {
            ForEach(products) { product in
                HStack(alignment: .center) {
                    ProductImageView(imageUrl: product.imageUrl)
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        Text(product.name)
                            .accessibilityIdentifier("productNameTextView")
                            .titleStyle()
                        
                        ForEach(product.features, id: \.self) { feature in
                            HStack(alignment: .top) {
                                Text("•")
                                
                                Text(feature)
                                    .accessibilityIdentifier("productFeatureTextView")
                                    .subtitleStyle()
                            }
                        }
                        
                        Text("\(product.priceInclVat)")
                            .headerStyle()
                        
                        Spacer()
                    }
                    .padding()
                }
                .listRowSeparator(.hidden)
                
                Divider()
            }
        }
    }
}

#Preview {
    ProductResultsListView(products: ProductModel.fakeProducts)
}
