//
//  CartCollectionViewCell.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 11.01.2022.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    
    var indexPath:IndexPath?
    var cartCollectionViewProtocol:CartCollectionViewProtocol?
    
    @IBOutlet weak var foodImageFromCart: UIImageView!
    
    @IBOutlet weak var foodNameFromCart: UILabel!
    
    @IBOutlet weak var totalPriceFood: UILabel!
    
    @IBAction func reduceAmountCart(_ sender: Any) {
        
    }
    
    @IBOutlet weak var foodAmountCart: UILabel!
    
    @IBAction func increaseAmountCart(_ sender: Any) {
        
    }
    
    @IBAction func deleteFoodFromCart(_ sender: Any) {
        if let index = indexPath {
            cartCollectionViewProtocol?.deleteFood(indexPath: index)
        }
    }
}

protocol CartCollectionViewProtocol {
    func deleteFood(indexPath:IndexPath)
}
