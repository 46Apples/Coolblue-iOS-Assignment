// Decoded [ProductsResponse] fake data.

extension ProductsResponse {
    static var fakeDecodedResponse: ProductsResponse {
        .init(products: [
            .init(
                productId: 785359,
                productName: "Apple iPhone 6 32GB Grijs",
                productImage: "https://image.coolblue.nl/300x750/products/818870",
                USPs: [
                    "32 GB opslagcapaciteit",
                    "4,7 inch Retina HD scherm",
                    "iOS 11"
                ],
                salesPriceIncVat: 369
            ),
            .init(
                productId: 793277,
                productName: "Apple iPhone X 64GB Space Gray",
                productImage: "https://image.coolblue.nl/300x750/products/982902",
                USPs: [
                    "64 GB opslagcapaciteit",
                    "5,8 inch Retina HD scherm",
                    "iOS 11"
                ],
                salesPriceIncVat: 1079
            ),
            .init(
                productId: 793664,
                productName: "Apple iPhone 8 64GB Space Grey",
                productImage: "https://image.coolblue.nl/300x750/products/984093",
                USPs: [
                    "64 GB opslagcapaciteit",
                    "4,7 inch Retina HD scherm",
                    "iOS 11"
                ],
                salesPriceIncVat: 769
            ),
            .init(
                productId: 809680,
                productName: "Apple iPad (2018) 128GB Wifi Space Gray",
                productImage: "https://image.coolblue.nl/300x750/products/1010388",
                USPs: [
                    "9,7 inch Retina scherm",
                    "Internet alleen via wifi",
                    "128 GB opslagcapaciteit"
                ],
                salesPriceIncVat: 449
            ),
            .init(
                productId: 673324,
                productName: "Apple Pencil",
                productImage: "https://image.coolblue.nl/300x750/products/455277",
                USPs: [
                    "Geschikt voor iPad Pro en iPad (2018)",
                    "Lightning connector",
                    "Palm rejection",
                    "Drukgevoelig",
                    "Bluetooth"
                ],
                salesPriceIncVat: 99
            )
        ])
    }
}
