import Foundation
@testable import CoolblueAssignment

// Raw [ProductsResponse] json test data.

extension Data {
    static var mockRawResponse: Data {
        Data(
            """
            {
                "products": [
                    {
                        "productId": 785359,
                        "productName": "Apple iPhone 6 32GB Grijs",
                        "reviewInformation": {
                            "reviews": [],
                            "reviewSummary": {
                                "reviewAverage": 9.1,
                                "reviewCount": 952
                            }
                        },
                        "USPs": [
                            "32 GB opslagcapaciteit",
                            "4,7 inch Retina HD scherm",
                            "iOS 11"
                        ],
                        "availabilityState": 2,
                        "salesPriceIncVat": 369,
                        "productImage": "https://image.coolblue.nl/300x750/products/818870",
                        "coolbluesChoiceInformationTitle": "middenklasse iPhone",
                        "promoIcon": {
                            "text": "middenklasse iPhone",
                            "type": "coolblues-choice"
                        },
                        "nextDayDelivery": true
                    },
                    {
                        "productId": 793277,
                        "productName": "Apple iPhone X 64GB Space Gray",
                        "reviewInformation": {
                            "reviews": [],
                            "reviewSummary": {
                                "reviewAverage": 9.2,
                                "reviewCount": 209
                            }
                        },
                        "USPs": [
                            "64 GB opslagcapaciteit",
                            "5,8 inch Retina HD scherm",
                            "iOS 11"
                        ],
                        "availabilityState": 2,
                        "salesPriceIncVat": 1079,
                        "productImage": "https://image.coolblue.nl/300x750/products/982902",
                        "coolbluesChoiceInformationTitle": "een topklasse iPhone",
                        "promoIcon": {
                            "text": "een topklasse iPhone",
                            "type": "coolblues-choice"
                        },
                        "nextDayDelivery": true
                    },
                    {
                        "productId": 793664,
                        "productName": "Apple iPhone 8 64GB Space Grey",
                        "reviewInformation": {
                            "reviews": [],
                            "reviewSummary": {
                                "reviewAverage": 9.3,
                                "reviewCount": 277
                            }
                        },
                        "USPs": [
                            "64 GB opslagcapaciteit",
                            "4,7 inch Retina HD scherm",
                            "iOS 11"
                        ],
                        "availabilityState": 2,
                        "salesPriceIncVat": 769,
                        "productImage": "https://image.coolblue.nl/300x750/products/984093",
                        "nextDayDelivery": true
                    },
                    {
                        "productId": 809680,
                        "productName": "Apple iPad (2018) 128GB Wifi Space Gray",
                        "reviewInformation": {
                            "reviews": [],
                            "reviewSummary": {
                                "reviewAverage": 9.6,
                                "reviewCount": 75
                            }
                        },
                        "USPs": [
                            "9,7 inch Retina scherm",
                            "Internet alleen via wifi",
                            "128 GB opslagcapaciteit"
                        ],
                        "availabilityState": 2,
                        "salesPriceIncVat": 449,
                        "productImage": "https://image.coolblue.nl/300x750/products/1010388",
                        "coolbluesChoiceInformationTitle": "een middenklasse iPad",
                        "promoIcon": {
                            "text": "een middenklasse iPad",
                            "type": "coolblues-choice"
                        },
                        "nextDayDelivery": true
                    },
                    {
                        "productId": 673324,
                        "productName": "Apple Pencil",
                        "reviewInformation": {
                            "reviews": [],
                            "reviewSummary": {
                                "reviewAverage": 9.3,
                                "reviewCount": 136
                            }
                        },
                        "USPs": [
                            "Geschikt voor iPad Pro en iPad (2018)",
                            "Lightning connector",
                            "Palm rejection",
                            "Drukgevoelig",
                            "Bluetooth"
                        ],
                        "availabilityState": 2,
                        "salesPriceIncVat": 99,
                        "productImage": "https://image.coolblue.nl/300x750/products/455277",
                        "nextDayDelivery": true
                    }
                ],
                "currentPage": 1,
                "pageSize": 24,
                "totalResults": 70,
                "pageCount": 3
            }
            """.utf8
        )
    }
}

// Decoded [ProductsResponse] test data.

extension ProductsResponse {
    static var mockDecodedEmptyResponse: ProductsResponse {
        .init(products: [])
    }
    
    static var mockDecodedResponse: ProductsResponse {
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
