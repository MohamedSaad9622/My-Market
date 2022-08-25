//
//  ProductModel_firebase.swift
//  My Market
//
//  Created by MAC on 25/08/2022.
//

import Foundation

struct ProductModel_firebase: Codable {
    let id: Int
    let title: String
    let image: Image
    let timeCreated: String
}
