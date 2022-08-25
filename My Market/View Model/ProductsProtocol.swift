//
//  ProductsProtocol.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import Foundation

protocol ProductsProtocol {
    
    func fetchData ()
    var  bindingData: (([ProductModel]?, Error?) -> Void ) {set get}
    
    // add product to ShoppingCart
    func addToShoppingCart(product: ProductModel)
    var addToShoppingCart_status: ((Error?) -> Void) {set get}
    
    // remove from ShoppingCart
    var removeFromShoppingCart_status: ((Error?) -> Void) {set get}
    func removeFromShoppingCart(productId: Int)
    
}
