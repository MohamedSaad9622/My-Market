//
//  Products_Model.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import Foundation

struct Products: Codable {
    let products: [ProductModel]
}


struct ProductModel: Codable {
    let id: Int
    let title: String
    let image: Image
}

struct Image: Codable {
    let src: String
}
