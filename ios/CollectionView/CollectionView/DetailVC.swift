//
//  DetailVC.swift
//  CollectionView
//
//  Created by cemal tüysüz on 20.12.2021.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var countryDetailTitle: UILabel!
    @IBOutlet weak var countryDetailCapital: UILabel!
    
    var country:Country?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let c = country {
            countryDetailTitle.text = c.countryName!
            countryDetailCapital.text = c.countryCapital!
        }
    }

    @IBAction func VisaButton(_ sender: Any) {
    }
}
