//
//  UserDefaultProtocol.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 12.01.2022.
//

import Foundation

protocol UserDefaultProtocol {
    
    func addToCart(foodId:Int,key:String)
    
    func getTheBasket(key:String)
}
