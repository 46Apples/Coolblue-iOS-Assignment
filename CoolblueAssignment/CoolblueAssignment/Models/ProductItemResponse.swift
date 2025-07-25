struct ProductItemResponse: Decodable, Equatable {
    let productId: Int
    let productName: String
    let productImage: String
    let USPs: [String]
    let salesPriceIncVat: Double
}

