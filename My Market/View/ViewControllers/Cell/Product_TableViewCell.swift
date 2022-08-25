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

    @IBOutlet weak private var product_imageview: UIImageView!
    @IBOutlet weak private var productTitle_label: UILabel!
    @IBOutlet weak private var addToCart_button: UIButton!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addProductToCart(_ sender: Any) {
        
    }
    
    
    func setCell(product: ProductModel) {
        self.productTitle_label.text = product.title
        AF.request(product.image.src).responseImage { response in
            if case .success(let image) = response.result {
                self.product_imageview.image = image
            }
        }
    }
    
}
