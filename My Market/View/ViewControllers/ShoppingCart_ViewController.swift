//
//  ShoppingCart_ViewController.swift
//  My Market
//
//  Created by MAC on 25/08/2022.
//

import UIKit

class ShoppingCart_ViewController: UIViewController {

    @IBOutlet weak var productsTableView: UITableView!
    
    var productsArray: [ProductModel_firebase] = []
    var shoppingCartModelView: ShoppingCart_Protocol = ShoppingCart_ViewModel()
    var networkIndicator = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.productsTableView.register(UINib(nibName: Constants.product_cell_nib, bundle: nil), forCellReuseIdentifier: Constants.product_cell_id)
        
        responseOfFetchProducts()
        responseOfRemoveProduct()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.addNetworkIndicator()
        shoppingCartModelView.fetchProducts()
    }
    
    
    func addNetworkIndicator() {
        DispatchQueue.main.async {
            self.networkIndicator.style = .large
            self.networkIndicator.center = self.view.center
            self.networkIndicator.startAnimating()
            self.view.addSubview(self.networkIndicator)
        }
    }
    
    
}


//MARK: -                                       TABLE VIEW PROTOCOLS


extension ShoppingCart_ViewController: UITableViewDelegate {
    
}

extension ShoppingCart_ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.product_cell_id, for: indexPath) as? Product_TableViewCell else { return UITableViewCell() }
        cell.removeFromCartDelegate = self
        cell.setCell(productTitle: productsArray[indexPath.section].title, productImage: productsArray[indexPath.section].image.src, productIndex: indexPath.section)
        return cell
    }
    
    
}


//MARK: -                           Response of Fetch Products


extension ShoppingCart_ViewController {
    
    func responseOfFetchProducts() {
        shoppingCartModelView.bindingProducts = { products, error in
            self.networkIndicator.stopAnimating()
            if let error = error {
                let alert = UIAlertController(title: "Warning", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { _ in
                    self.addNetworkIndicator()
                    self.shoppingCartModelView.fetchProducts()
                }))
                
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
            if let products = products {
                self.productsArray = products
                DispatchQueue.main.async {
                    if self.productsArray.count == 0 {
                    addAlert(title: "Warning", message: "There are no Products in Shopping Cart", ActionTitle: "Cancel", viewController: self)
                    }
                    self.productsTableView.reloadData()
                }
            }
            
        }
    }
}



//MARK: -                                   Remove from Shopping Cart Protocol


extension ShoppingCart_ViewController: RemoveFromCart_Protocol {
    
    func RemoveFromCart(productIndex: Int) {
        let alert = UIAlertController(title: "Warning", message: "Are you sure you want to remove this product from Shopping Cart", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.shoppingCartModelView.removeFromShoppingCart(productId: self.productsArray[productIndex].id)
            self.productsArray.remove(at: productIndex)
        }))
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func responseOfRemoveProduct() {
        
        self.shoppingCartModelView.removeFromShoppingCart_status = { error in
            if let error = error {
                addAlert(title: "Error", message: error.localizedDescription, ActionTitle: "Cancel", viewController: self)
            }
            else{
                DispatchQueue.main.async {
                    self.productsTableView.reloadData()
                }
                addAlert(title: "Done", message: "The product has been successfully removed from the shopping cart", ActionTitle: "OK", viewController: self)
            }
        }
    }

}
