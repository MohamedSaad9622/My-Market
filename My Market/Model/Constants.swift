//
//  Constants.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import Foundation

enum Constants: String {
    
    case product_cell_id = "productsCell"
    case product_cell_nib = "Product_TableViewCell"
    case collectionNameInFirebase = "Shopping Cart"
    
}


enum AddToCart_ButtonStatus: String {
    case notAdded = "cart.badge.plus"
    case added = "cart.badge.plus.fill"
}
