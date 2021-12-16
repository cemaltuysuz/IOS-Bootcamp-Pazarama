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
    @IBOutlet weak var person: UIImageView!
    @IBOutlet weak var person2: UIImageView!
    
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
        
        // Person
        person.layer.masksToBounds = true
        person.layer.cornerRadius = person.bounds.width / 2
        
        // Person 2
        person2.layer.masksToBounds = true
        person2.layer.cornerRadius = person2.bounds.width / 2
    }


}

