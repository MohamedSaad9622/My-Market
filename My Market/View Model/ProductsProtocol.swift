//
//  ProductsProtocol.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import Foundation

protocol ProductsProtocol {
    
    func fetchData ()
    var  bindingData: (([ProductModel]?, Error?) -> Void ) {set get}
    
}
