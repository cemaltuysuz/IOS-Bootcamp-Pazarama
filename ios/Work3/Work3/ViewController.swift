//
//  ViewController.swift
//  Work3
//
//  Created by cemal tüysüz on 14.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencyUnit: UIView!
    @IBOutlet weak var assetInfo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Currency Unit
        currencyUnit.layer.borderWidth = 0.5
        currencyUnit.layer.borderColor = UIColor(named: "LightGray")!.cgColor
        currencyUnit.layer.cornerRadius = 13
        
        // Asset info
        assetInfo.layer.borderWidth = 0.5
        assetInfo.layer.borderColor = UIColor(named: "LightGray")!.cgColor
        assetInfo.layer.cornerRadius = 13
    }


}

