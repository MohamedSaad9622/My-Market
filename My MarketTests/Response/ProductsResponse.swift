//
//  ProductsResponse.swift
//  My MarketTests
//
//  Created by MAC on 26/08/2022.
//

import Foundation

class ProductsResponse{
    
    static let jsonResponse: [String: Any?] = [
        "products": products
    ]
    static let products: [[String: Any?]] = [
        [
           "id": 7730623709398,
           "title": "ADIDAS | CLASSIC BACKPACK",
           "image": [
           "src": "https://cdn.shopify.com/s/files/1/0659/3796/5270/products/85cc58608bf138a50036bcfe86a3a362.jpg?v=1656280580"]
           ],
           [
           "id": 7730623381718,
           "title": "ADIDAS | KID'S STAN SMITH",
           
           "image": [
            "src": "https://cdn.shopify.com/s/files/1/0659/3796/5270/products/7883dc186e15bf29dad696e1e989e914.jpg?v=1656280565"
           ]
       ]
    ]
}
