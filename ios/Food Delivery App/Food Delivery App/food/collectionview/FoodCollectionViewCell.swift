//
//  FoodCollectionViewCell.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 13.01.2022.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    @IBOutlet weak var foodDeliveryTime: UILabel!
    @IBOutlet weak var foodPlace: UILabel!
    @IBOutlet weak var foodPoint: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    
    
    @IBAction func foodToDetailsButton(_ sender: Any) {
        
    }
}
