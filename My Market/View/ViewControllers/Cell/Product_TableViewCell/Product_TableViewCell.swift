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
    @IBOutlet weak private var addToCart_button: UIButton!
   
    var addToCartDelegate: AddToCart_Protocol?
    var removeFromCartDelegate: RemoveFromCart_Protocol?
    var productIndex: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func updateShoppingCart(_ sender: Any) {
        guard let productIndex = productIndex else { return }
        if let addToCartDelegate = addToCartDelegate {
            self.addToCartDelegate?.addToCart(productIndex: productIndex)
        }
        
        if let removeFromCartDelegate = removeFromCartDelegate {
            removeFromCartDelegate.RemoveFromCart(productIndex: productIndex)
        }

    }
    
    
    func setCell(productTitle: String, productImage: String, productIndex: Int) {
        self.productIndex = productIndex
        self.productTitle_label.text = productTitle
        AF.request(productImage).responseImage { response in
            if case .success(let image) = response.result {
                self.product_imageView.image = image
            }
        }
    }
    
}