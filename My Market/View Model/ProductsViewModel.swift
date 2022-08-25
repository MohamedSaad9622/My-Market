//
//  ProductsViewModel.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import Foundation

class ProductsViewModel: ProductsProtocol {
    
    var apiService: FetchProductsProtocol
    var firebaseManager: FirebaseServices
    
    init( apiService: FetchProductsProtocol = NetworkManager(), firebaseManager: FirebaseServices = FirebaseManager() ) {
        self.apiService = apiService
        self.firebaseManager = firebaseManager
    }

    
    
//MARK: -                                       Fetch products forom API
    
    var data: [ProductModel]? {
        didSet{
            bindingData(data, nil)
        }
    }
    
    var error: Error? {
        didSet{
            bindingData(nil, error)
        }
    }
    
    var bindingData: (([ProductModel]?, Error?) -> Void) = {_, _ in }
    
    func fetchData() {
        apiService.fetchProducts { products, error in
            if let products = products {
                self.data = products
            }
            if let error = error {
                self.error = error
            }
        }
    }
    
    
//MARK: -                                    Add Product To Shopping Cart
    
    var addToShoppingCart_error: Error? {
        didSet{
            addToShoppingCart_status(error)
        }
    }
    
    var addToShoppingCart_status: ((Error?) -> Void) = { _ in }
    
    func addToShoppingCart(product: ProductModel) {
        firebaseManager.addToShoppingCart(product: product) { error in
            if let error = error {
                self.addToShoppingCart_error = error
            }
            else{
                self.addToShoppingCart_error = nil
            }
        }
    }
    
    
    //MARK: -                                    Remove Product From Shopping Cart
    
    var removeFromShoppingCart_error: Error? {
        didSet{
            removeFromShoppingCart_status(error)
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
