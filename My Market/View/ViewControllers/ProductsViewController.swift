//
//  ProductsViewController.swift
//  My Market
//
//  Created by MAC on 24/08/2022.
//

import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet weak var products_tableView: UITableView!
    
    var productsArray: [ProductModel] = []
    
    var productsViewModel: ProductsProtocol = ProductsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.products_tableView.register(UINib(nibName: Constants.product_cell_nib.rawValue, bundle: nil), forCellReuseIdentifier: Constants.product_cell_id.rawValue)

        productsViewModel.fetchData()
        responseOfFetchProducts()
        responseOfAddToShoppingCart()
        responseOfRemoveFromShoppingCart()
    }
    
 
    func responseOfFetchProducts() {
        self.productsViewModel.bindingData = { products, error in
            if let products = products {
                self.productsArray = products
                print(self.productsArray)
                DispatchQueue.main.async {
                    self.products_tableView.reloadData()
                }
            }
            if let error = error {
                print("\(error.localizedDescription)")
            }
            
        }
    }

}




//MARK: -                                       TABLE VIEW PROTOCOLS


extension ProductsViewController: UITableViewDelegate {
    
}

extension ProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.product_cell_id.rawValue, for: indexPath) as? Product_TableViewCell else { return UITableViewCell() }
        cell.cartDelegate = self
        cell.setCell(product: productsArray[indexPath.row], productIndex: indexPath.row)
        return cell
    }
    
    
}


//MARK: -                                   Update Cart Protocol

extension ProductsViewController: UpdateCart_Protocol {
    
    func addToCart(productIndex: Int) {
        self.productsViewModel.addToShoppingCart(product: productsArray[productIndex])
    }
    
    func removeFromCart(productIndex: Int) {
        self.productsViewModel.removeFromShoppingCart(productId: productsArray[productIndex].id)
    }

    
//MARK: -                           Response of update Shopping Cart
    
    func responseOfAddToShoppingCart() {
        self.productsViewModel.addToShoppingCart_status = { error in
            if let error = error {
                addAlert(title: "Error", message: error.localizedDescription, ActionTitle: "Cancel", viewController: self)
            }
            else{
                DispatchQueue.main.async {
                    self.products_tableView.reloadData()
                }
                addAlert(title: "Done", message: "Product Added to Shopping Cart", ActionTitle: "OK", viewController: self)
            }
        }
    }
    
    func responseOfRemoveFromShoppingCart() {
        self.productsViewModel.removeFromShoppingCart_status = { error in
            if let error = error {
                addAlert(title: "Error", message: error.localizedDescription, ActionTitle: "Cancel", viewController: self)
            }
            else{
                DispatchQueue.main.async {
                    self.products_tableView.reloadData()
                }
                addAlert(title: "Done", message: "Product Removed From Shopping Cart", ActionTitle: "OK", viewController: self)
            }
            
        }
    }
    
    
    
}
