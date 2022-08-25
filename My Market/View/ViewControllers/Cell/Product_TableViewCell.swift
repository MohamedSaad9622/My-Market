//
//  TProduct_TableViewCell.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import UIKit
import Alamofire
import AlamofireImage


protocol UpdateCart_Protocol {
    func addToCart(productIndex: Int)
    func removeFromCart(productIndex: Int)
}

class Product_TableViewCell: UITableViewCell {

    @IBOutlet weak private var product_imageview: UIImageView!
    @IBOutlet weak private var productTitle_label: UILabel!
    @IBOutlet weak private var addToCart_button: UIButton!
   
    var cartDelegate: UpdateCart_Protocol?
    var productIndex: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addProductToCart(_ sender: Any) {
        guard let productIndex = productIndex else { return }
        if self.addToCart_button.currentBackgroundImage == UIImage(systemName: AddToCart_ButtonStatus.notAdded.rawValue) {
            self.cartDelegate?.addToCart(productIndex: productIndex)
            
        }
        
        if self.addToCart_button.currentBackgroundImage == UIImage(systemName: AddToCart_ButtonStatus.added.rawValue) {
            self.cartDelegate?.removeFromCart(productIndex: productIndex)
        }
        
    }
    
    
    func setCell(product: ProductModel, productIndex: Int) {
        self.productIndex = productIndex
        self.productTitle_label.text = product.title
        AF.request(product.image.src).responseImage { response in
            if case .success(let image) = response.result {
                self.product_imageview.image = image
            }
        }
    }
    
}
