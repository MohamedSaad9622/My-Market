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

    
    
//MARK: -                                       Fetch products from API
    
    var data: [ProductModel]? {
        didSet{
            bindingProducts(data, nil)
        }
    }
    
    var error: Error? {
        didSet{
            bindingProducts(nil, error)
        }
    }
    
    var bindingProducts: (([ProductModel]?, Error?) -> Void) = {_, _ in }
    
    func fetchProducts() {
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
            addToShoppingCart_status(addToShoppingCart_error)
        }
    }
    
    var addToShoppingCart_status: ((Error?) -> Void) = { _ in }
    
    func addToShoppingCart(product: ProductModel) {
        let newProduct: ProductModel_firebase = ProductModel_firebase(id: product.id, title: product.title, image: product.image, timeCreated: getCurrentTime())
        firebaseManager.addToShoppingCart(product: newProduct) { error in
            if let error = error {
                self.addToShoppingCart_error = error
            }
            else{
                self.addToShoppingCart_error = nil
            }
        }
    }
    
    
}
