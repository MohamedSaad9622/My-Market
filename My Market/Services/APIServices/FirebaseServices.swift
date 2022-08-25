//
//  FirebaseServices.swift
//  My Market
//
//  Created by MAC on 25/08/2022.
//

import Foundation

protocol FirebaseServices {
    
    func addToShoppingCart(product: ProductModel , completion: @escaping ((Error?) -> Void))
        
//    func fetchFavorites(completion: @escaping (([ProductEntity_firestore]?, Error?) -> Void))
    func removeFromShoppingCart(productId: Int, completion: @escaping ((Error?) -> Void))
    
}
