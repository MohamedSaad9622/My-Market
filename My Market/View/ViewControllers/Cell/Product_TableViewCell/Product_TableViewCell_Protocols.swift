//
//  Product_TableViewCell_Protocols.swift
//  My Market
//
//  Created by MAC on 25/08/2022.
//

import Foundation

protocol AddToCart_Protocol {
    func addToCart(productIndex: Int)
}

protocol RemoveFromCart_Protocol {
    func RemoveFromCart(productIndex: Int)
}
