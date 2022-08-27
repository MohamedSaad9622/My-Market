//
//  ProductsProtocol.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import Foundation

protocol ProductsProtocol {
    
    func fetchProducts()
    var  bindingProducts: (([ProductModel]?, Error?) -> Void ) {set get}
    
    
    func addToShoppingCart(product: ProductModel)
    var addToShoppingCart_status: ((Error?) -> Void) {set get}
    
    func removeFromShoppingCart(productId: Int)
    var removeFromShoppingCart_status: ((Error?) -> Void) {set get}
    
    func addedToCart(productId: Int) -> Bool
    
}
