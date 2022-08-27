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
    var networkIndicator = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.products_tableView.register(UINib(nibName: Constants.product_cell_nib, bundle: nil), forCellReuseIdentifier: Constants.product_cell_id)

        fetchProducts()
        responseOfFetchProducts()
        responseOfAddToShoppingCart()
    }

    override func viewWillAppear(_ animated: Bool) {
        if productsArray.count == 0 {
            fetchProducts()
        }
    }
    
    func fetchProducts() {
        productsViewModel.fetchProducts()
        self.addNetworkIndicator()
    }
    
    func addNetworkIndicator() {
        DispatchQueue.main.async {
            self.networkIndicator.style = .large
            self.networkIndicator.center = self.view.center
            self.networkIndicator.startAnimating()
            self.view.addSubview(self.networkIndicator)
        }
    }
    
    
//MARK: -                                       Response of Fetch Products
 
    func responseOfFetchProducts() {
        
        self.productsViewModel.bindingProducts = { products, error in
            self.networkIndicator.stopAnimating()
            if let products = products {
                self.productsArray = products
                DispatchQueue.main.async {
                    self.products_tableView.reloadData()
                }
            }
            if let error = error {
                addAlert(title: AlertTitle.Warning.rawValue, message: error.localizedDescription, viewController: self, actionTitle: AlertActionTitle.Cancel.rawValue, additional_Action: UIAlertAction(title: AlertActionTitle.TryAgain.rawValue, style: .default, handler: { _ in
                    self.fetchProducts()
                }))
            }
            
        }
    }

}




//MARK: -                                       TABLE VIEW PROTOCOLS


extension ProductsViewController: UITableViewDelegate {
    
}

extension ProductsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.product_cell_id, for: indexPath) as? Product_TableViewCell else { return UITableViewCell() }
        cell.addToCartDelegate = self
        cell.setCell(productTitle: productsArray[indexPath.section].title, productImage: productsArray[indexPath.section].image.src, productIndex: indexPath.section)
        return cell
    }
    
    
}


//MARK: -                                   Add To Shopping Cart Protocol


extension ProductsViewController: AddToCart_Protocol {
    func addToCart(productIndex: Int) {
        self.productsViewModel.addToShoppingCart(product: productsArray[productIndex])
    }

    
    func responseOfAddToShoppingCart() {
        self.productsViewModel.addToShoppingCart_status = { error in
            if let error = error {
                addAlert(title: AlertTitle.Error.rawValue, message: error.localizedDescription, viewController: self, actionTitle: AlertActionTitle.Cancel.rawValue, additional_Action: nil)
            }
            else{
                DispatchQueue.main.async {
                    self.products_tableView.reloadData()
                }
                addAlert(title: AlertTitle.Done.rawValue, message: "The product has been successfully added to the cart", viewController: self, actionTitle: AlertActionTitle.Ok.rawValue, additional_Action: nil)
            }
        }
    }

    
}
