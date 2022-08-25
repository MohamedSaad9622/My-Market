//
//  FirebaseManager.swift
//  My Market
//
//  Created by MAC on 25/08/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class FirebaseManager: FirebaseServices {
    
    let database = Firestore.firestore()
    
 
//MARK: -                               Add Product to Shopping Cart
    
    func addToShoppingCart(product: ProductModel, completion: @escaping ((Error?) -> Void)) {
        do{
            try database.collection(Constants.collectionNameInFirebase.rawValue).document(String(product.id)).setData(from: product)
            completion(nil)
        }
        catch let error {
            completion(error)
        }

    }
    
    
//MARK: -                               Remove Product from Shopping Cart
    
    func removeFromShoppingCart(productId: Int, completion: @escaping ((Error?) -> Void)) {
        
        database.collection(Constants.collectionNameInFirebase.rawValue).document("\(productId)").updateData([
            "id": FieldValue.delete(),
            "title": FieldValue.delete(),
            "image": FieldValue.delete()
        ])
        { error in

            if let error = error {
                completion(error)

            } else {
                
                // delete document
                self.database.collection(Constants.collectionNameInFirebase.rawValue).document("\(productId)").delete() { error in
                        if let error = error {
                            completion(error)
                        } else {
                            completion(nil)
                        }
                    }
                }
            }
        
    }
    
    
    
}
