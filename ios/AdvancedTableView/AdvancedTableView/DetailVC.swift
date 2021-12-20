//
//  DetailVC.swift
//  AdvancedTableView
//
//  Created by cemal tüysüz on 19.12.2021.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var productDetailTitle: UILabel!
    @IBOutlet weak var productDetailımage: UIImageView!
    @IBOutlet weak var productDetailPrice: UILabel!
    
    var product:Product?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let p = product {
            productDetailTitle.text = p.productName!
            productDetailımage.image = UIImage(named: p.productImage!)
            productDetailPrice.text = "\(p.productPrice!)₺"
        }
    }
    @IBAction func addToChart(_ sender: Any) {
        
    }
}
