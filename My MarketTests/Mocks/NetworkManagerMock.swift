//
//  NetworkManagerMock.swift
//  My MarketTests
//
//  Created by MAC on 26/08/2022.
//

import Foundation
import Alamofire
@testable import My_Market

class NetworkManagerMock: FetchProductsProtocol {
    
    var shouldReturnError: Bool
    
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    
    func fetchProducts(completion: @escaping (([ProductModel]?, Error?) -> Void)) {
        switch shouldReturnError {
        case true:
            completion(nil, NetworkError.failedFetchingData)
        case false:
            guard let data = try? JSONSerialization.data(withJSONObject: ProductsResponse.jsonResponse, options: .fragmentsAllowed) else {
                completion(nil, NetworkError.failedFetchingData)
                return
            }
            
            if let decodedData: Products = try? JSONDecoder().decode(Products.self, from: data) {
                completion(decodedData.products, nil)
            }else{
                completion(nil, NetworkError.faildeDecodeData)
            }
            
            
        }
    }
    
    enum NetworkError: Error {
        case failedFetchingData
        case faildeDecodeData
    }
}
