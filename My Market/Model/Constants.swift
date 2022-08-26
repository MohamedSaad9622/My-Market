//
//  Constants.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import Foundation


struct Constants {
    
    static let products_Storyboard = "Products"
    static let tabBar_viewController_id = "TabBarViewControllerId"
    
    static let product_cell_id = "productsCell"
    static let product_cell_nib = "Product_TableViewCell"
    
    static let collectionNameInFirebase = "Shopping Cart"
    
    static let MaxNumberOfDays_inShoppingCart: Int = 3

}


enum UpdateCart_ButtonStatus: String {
    case added = "cart.badge.plus"
    case notAdded = "cart.badge.minus"
}
