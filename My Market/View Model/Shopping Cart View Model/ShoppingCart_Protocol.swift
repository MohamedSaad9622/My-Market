//
//  ShoppingCart_Protocol.swift
//  My Market
//
//  Created by MAC on 25/08/2022.
//

import Foundation


protocol ShoppingCart_Protocol {
    
    func fetchProducts()
    var  bindingProducts: (([ProductModel_firebase]?, Error?) -> Void ) {set get}
    
    // remove from ShoppingCart
    var removeFromShoppingCart_status: ((Error?) -> Void) {set get}
    func removeFromShoppingCart(productId: Int)
    
}
