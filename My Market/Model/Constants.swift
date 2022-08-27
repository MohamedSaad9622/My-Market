//
//  Constants.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import Foundation


struct Constants {
    
    //MARK: -                                   STORYBOARD NAME
    static let products_Storyboard = "Products"
    
    //MARK: -                               VIEW CONTROLLER IDENTIFIER
    
    static let tabBar_viewController_id = "TabBarViewControllerId"
    
    //MARK: -                               CELL NIB NAME AND IDENTIFIER
    
    static let product_cell_id = "productsCell"
    static let product_cell_nib = "Product_TableViewCell"

    
    //MARK: -                                        OTHERS
    
    static let collectionNameInFirebase = "Shopping Cart"
    static let MaxNumberOfDays_inShoppingCart: Int = 1
    static let splashScreen_VideoName = "splashScreen"

}


enum ProductFirebaseModel_keys: String {
    case id, title, image, timeCreated
}


enum UpdateCart_ButtonStatus: String {
    case add = "cart.badge.plus"
    case remove = "cart.badge.minus.fill"
}

enum AlertTitle: String {
    case Error, Warning, Done
}

enum AlertActionTitle: String {
    case Ok, Cancel, TryAgain = "Try Again"
}
