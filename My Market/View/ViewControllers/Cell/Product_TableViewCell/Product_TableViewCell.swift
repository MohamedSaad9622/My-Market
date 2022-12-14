//
//  TProduct_TableViewCell.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import UIKit
import Alamofire
import AlamofireImage



class Product_TableViewCell: UITableViewCell {

    @IBOutlet weak private var product_imageView: UIImageView!
    @IBOutlet weak private var productTitle_label: UILabel!
    @IBOutlet weak private var updateShoppingCart_button: UIButton!
   
    var updateCartDelegate: updateShoppingCart_Protocol?
    var removeFromCartDelegate: RemoveFromCart_Protocol?
    var productIndex: Int?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func updateShoppingCart(_ sender: Any) {
        guard let productIndex = productIndex else { return }
        
        if let updateCartDelegate = updateCartDelegate {
            if self.updateShoppingCart_button.currentBackgroundImage == UIImage(systemName: UpdateCart_ButtonStatus.add.rawValue){
                self.updateShoppingCart_button.setBackgroundImage(UIImage(systemName: UpdateCart_ButtonStatus.remove.rawValue), for: .normal)
                updateCartDelegate.addToCart(productIndex: productIndex)
            }
            else{
                self.updateShoppingCart_button.setBackgroundImage(UIImage(systemName: UpdateCart_ButtonStatus.add.rawValue), for: .normal)
                updateCartDelegate.RemoveFromCart(productIndex: productIndex)
            }
            
        }
        
        if let removeFromCartDelegate = removeFromCartDelegate {
            removeFromCartDelegate.RemoveFromCart(productIndex: productIndex)
        }

    }
    
    
    func setCell(productTitle: String, productImage: String, productIndex: Int, addedToCart: Bool) {
        // to set background fo button to add or remove image
        if addedToCart {
            self.updateShoppingCart_button.setBackgroundImage(UIImage(systemName: UpdateCart_ButtonStatus.remove.rawValue), for: .normal)
        }else{
            self.updateShoppingCart_button.setBackgroundImage(UIImage(systemName: UpdateCart_ButtonStatus.add.rawValue), for: .normal)
        }
        self.productIndex = productIndex
        self.productTitle_label.text = productTitle
        AF.request(productImage).responseImage { response in
            if case .success(let image) = response.result {
                self.product_imageView.image = image
            }
        }
    }
    
}
