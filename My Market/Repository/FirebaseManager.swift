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
    
 
//MARK: -                               Add Product to Firebase
    
    func addToShoppingCart(product: ProductModel_firebase, completion: @escaping ((Error?) -> Void)) {
        do{
            try database.collection(Constants.collectionNameInFirebase).document(String(product.id)).setData(from: product)
            completion(nil)
        }
        catch let error {
            completion(error)
        }

    }
    
    
//MARK: -                               Remove Product from Firebase
    
    
    func removeFromShoppingCart(productId: Int, completion: @escaping ((Error?) -> Void)) {
        
        database.collection(Constants.collectionNameInFirebase).document("\(productId)").updateData([
            ProductFirebaseModel_keys.id.rawValue: FieldValue.delete(),
            ProductFirebaseModel_keys.image.rawValue: FieldValue.delete(),
            ProductFirebaseModel_keys.title.rawValue: FieldValue.delete(),
            ProductFirebaseModel_keys.timeCreated.rawValue: FieldValue.delete()
        ])
        { error in

            if let error = error {
                completion(error)

            } else {
                
                // delete document
                self.database.collection(Constants.collectionNameInFirebase).document("\(productId)").delete() { error in
                        if let error = error {
                            completion(error)
                        } else {
                            completion(nil)
                        }
                    }
                }
            }
        
    }
    
    
//MARK: -                                   Fetch Products From Firebase
        
        
        
        func fetchProducts(completion: @escaping (([ProductModel_firebase]?, Error?) -> Void)) {
            
            var products: [ProductModel_firebase] = []
            
            database.collection(Constants.collectionNameInFirebase).getDocuments() { (querySnapshot, error) in
                if let error = error {
                    completion(nil, error)
                } else {
                    for document in querySnapshot!.documents {
                        let product = try? document.data(as: ProductModel_firebase.self)
                        if let product = product {
                            products.append(product)
                        }

                    }
                    completion(products, nil)
                }
            }
            
        }
    
    
    
}
