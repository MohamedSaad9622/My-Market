//
//  APIServices.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import Foundation

protocol FetchProductsProtocol {
    
    func fetchProducts(completion: @escaping (([ProductModel]?, Error?) -> Void ) )
    
}
