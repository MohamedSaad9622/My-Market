//
//  NetworkManager.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import Foundation
import Alamofire

class NetworkManager: FetchProductsProtocol {
    
    func fetchProducts(completion: @escaping (([ProductModel]?, Error?) -> Void)) {
        
        if let url = URL(string: UrlServices.products()) {
            AF.request(url).responseDecodable(of: Products.self) { response in
                if let products = response.value {
                    completion(products.products, nil)
                }
                if let error = response.error {
                    completion(nil, error)
                }
            }
        }
        
    }
    
    
}
