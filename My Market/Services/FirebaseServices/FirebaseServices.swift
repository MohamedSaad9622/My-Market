//
//  FirebaseServices.swift
//  My Market
//
//  Created by MAC on 25/08/2022.
//

import Foundation

protocol FirebaseServices {
    
    func addToShoppingCart(product: ProductModel_firebase , completion: @escaping ((Error?) -> Void))
    func removeFromShoppingCart(productId: Int, completion: @escaping ((Error?) -> Void))
    func fetchProducts(completion: @escaping (([ProductModel_firebase]?, Error?) -> Void))
    
}
