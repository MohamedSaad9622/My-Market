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
                print("*****************\(error.localizedDescription)")
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
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return productsArray.count
//    }
//
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.product_cell_id.rawValue, for: indexPath) as? Product_TableViewCell else { return UITableViewCell() }
        cell.setCell(product: productsArray[indexPath.row])
        return cell
    }
    
    
}
