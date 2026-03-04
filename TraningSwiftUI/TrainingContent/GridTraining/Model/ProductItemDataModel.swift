//
//  ProductItemDataMode.swift
//  TraningSwiftUI
//
//  Created by Sigfri on 3/4/26.
//

import Foundation

// MARK: - WelcomeElement
struct AllProductList: Decodable {
    var allProductList: [ProductItemDataModel] = []

    var discountedProduct: [ProductItemDataModel] {
        allProductList.filter { $0.isDiscounted }
    }

    var totalAmount: Double {
        allProductList.reduce(0) { $0 + Double($1.price) }
    }
}

struct ProductItemDataModel: Codable {
    let id: Int
    let title, slug: String
    let price: Int
    let description: String
    let category: Category
    let images: [String]
    let creationAt, updatedAt: String

    var isSelected: Bool? = false

    var isDiscounted: Bool {
        return id % 2 == 0
    }

    var priceString: String {
        let discountAmount: Double = Double(price) * discountPercentage
        let finalPrice: Double = Double(price) - discountAmount
        return "PHP \(finalPrice)"
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
    let slug: String
    let image: String
    let creationAt, updatedAt: String
}
