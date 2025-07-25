struct ProductModel: Equatable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let features: [String]
    let priceInclVat: String
}

// Fake data consumed in SwiftUI content previews.

#if DEBUG

extension ProductModel {
    static var fakeProducts: [ProductModel] {
        [
            .init(
                id: 1,
                name: "Fake product 1",
                imageUrl: "https://image.coolblue.nl/300x750/products/422838",
                features: ["Fake feature 1", "Fake feature 2"],
                priceInclVat: "123,45"
            ),
            .init(
                id: 2,
                name: "Fake product 2",
                imageUrl: "https://image.coolblue.nl/300x750/products/943711",
                features: ["Fake feature 1", "Fake feature 2, Fake feature 3"],
                priceInclVat: "456"
            ),
            .init(
                id: 3,
                name: "Fake product 3",
                imageUrl: "https://image.coolblue.nl/300x750/products/930605",
                features: ["Fake feature 1"],
                priceInclVat: "789"
            )
        ]
    }
}

#endif
