//
//  ShoppingCart_ViewModel.swift
//  My Market
//
//  Created by MAC on 25/08/2022.
//

import Foundation


class ShoppingCart_ViewModel: ShoppingCart_Protocol {
    
    
    var firebaseManager: FirebaseServices
    
    init( firebaseManager: FirebaseServices = FirebaseManager() ) {
        self.firebaseManager = firebaseManager
    }
    
  

//MARK: -                           Fetch Products From Firebase
    
   
    var fetchProducts_error: Error? {
        didSet{
            bindingProducts(nil, fetchProducts_error)
        }
    }
    
    var fetchProducts_data: [ProductModel_firebase]? {
        didSet{
            bindingProducts(fetchProducts_data, nil)
        }
    }
    
    var bindingProducts: (([ProductModel_firebase]?, Error?) -> Void) = { _, _ in }
    
    func fetchProducts() {
        firebaseManager.fetchProducts { products, error in
            if let error = error {
                self.fetchProducts_error = error
            }
            if let products = products {
                self.fetchProducts_data = self.filterProducts(products: products)
            }
        }
    }
    
    func filterProducts(products: [ProductModel_firebase]) -> [ProductModel_firebase] {
        var filteredProducts: [ProductModel_firebase] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        for product in products {
            if let date = dateFormatter.date(from: product.timeCreated) {
                let numberOfDays = Calendar.current.dateComponents([.day], from: date, to: Date()).day ?? 0
                if numberOfDays < Constants.MaxNumberOfDays_inShoppingCart {
                    filteredProducts.append(product)
                }else{
                    firebaseManager.removeFromShoppingCart(productId: product.id) { error in
                        if let error = error {
                            print(error.localizedDescription)
                        }
                        
                    }
                }
            }
        }
        return filteredProducts
    }

    
    
//MARK: -                           Remove Product From Shopping Cart
    
    
    var removeFromShoppingCart_error: Error? {
        didSet{
            removeFromShoppingCart_status(removeFromShoppingCart_error)
        }
    }
    
    var removeFromShoppingCart_status: ((Error?) -> Void) = { _ in }
    
    func removeFromShoppingCart(productId: Int) {
        firebaseManager.removeFromShoppingCart(productId: productId) { error in
            if let error = error {
                self.removeFromShoppingCart_error = error
            }
            else{
                self.removeFromShoppingCart_error = nil
            }
        }
    }
    
}
