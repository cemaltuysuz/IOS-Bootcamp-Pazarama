//
//  ViewController.swift
//  AdvancedTableView
//
//  Created by cemal tüysüz on 19.12.2021.
//

import UIKit

class ViewController: UIViewController {

    var productList = [Product]()
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTableView.delegate = self
        productTableView.dataSource = self
        
        let p1 = Product(productId: 1, productName: "Macbook PRO 14", productImage: "computer", productPrice: 30000.0)
        let p2 = Product(productId: 2, productName: "Rayban Club Master", productImage: "glass", productPrice: 2900.0)
        let p3 = Product(productId: 3, productName: "Sony ZX Series", productImage: "headphone", productPrice: 2800.0)
        let p4 = Product(productId: 4, productName: "Gio Armani", productImage: "parfume", productPrice: 2000.0)
        let p5 = Product(productId: 5, productName: "Iphone 13 PRO", productImage: "phone", productPrice: 15000.0)
        let p6 = Product(productId: 6, productName: "Casio", productImage: "watch", productPrice: 5000.0)
        
        productList.append(p5)
        productList.append(p1)
        productList.append(p2)
        productList.append(p3)
        productList.append(p4)
        productList.append(p6)
        
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource,CellProtocol{
    
    func buttonOnClick(indexPath: IndexPath) {
        let product = productList[indexPath.row]
        print(print("Selectedd : \(product.productName!)"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Current product
        let product = productList[indexPath.row]
        // Get custom cell and convert to ProductTableView Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell",for: indexPath) as! ProductTableViewCell
        
        // Bind
        cell.productImage.image = UIImage(named: product.productImage!)
        cell.productTitle.text = product.productName!
        cell.productPrice.text = "\(product.productPrice!)₺"
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        cell.backgroundColor = UIColor(white: 0.90, alpha: 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = productList[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: product)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let product = sender as! Product
            let targetVC = segue.destination as! DetailVC
            targetVC.product = product
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let product = productList[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){(contextualAction,view,bool) in
            print("Delete \(product.productName!)")
        }
        
        let updateAction = UIContextualAction(style: .normal, title: "Update"){(contextualAction,view,bool) in
            print("Update \(product.productName!)")
        }
        return UISwipeActionsConfiguration(actions: [deleteAction,updateAction])
    }
    
}

