//
//  AddAlertView.swift
//  My Market
//
//  Created by MAC on 25/08/2022.
//

import UIKit

func addAlert(title:String, message:String, viewController: UIViewController, actionTitle:String, additional_Action: UIAlertAction?) {
    let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: actionTitle, style: .cancel, handler: nil))
    if let action = additional_Action {
        alert.addAction(action)
    }
    DispatchQueue.main.async {
        viewController.present(alert, animated: true, completion: nil)
    }
    
}

