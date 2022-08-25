//
//  ProductsViewModel.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import Foundation

class ProductsViewModel: ProductsProtocol {
    
    var apiService: FetchProductsProtocol
    
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
    
    init() {
        apiService = NetworkManager()
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
    
    
}
