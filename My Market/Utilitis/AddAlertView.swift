//
//  AddAlertView.swift
//  My Market
//
//  Created by MAC on 25/08/2022.
//

import UIKit

func addAlert(title:String, message:String, ActionTitle:String, viewController: UIViewController) {
    let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: ActionTitle, style: .cancel, handler: nil))
    
    DispatchQueue.main.async {
        viewController.present(alert, animated: true, completion: nil)
    }
    
}

