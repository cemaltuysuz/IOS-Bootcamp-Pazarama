//
//  UserDefaultService.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 12.01.2022.
//

import Foundation

class UserDefaultService : UserDefaultProtocol {
    static let shared = UserDefaultService()
    
    private let ud = UserDefaults.standard
    
    func addToCart(foodId: Int, key: String) {
        if let currentDictionary = ud.dictionary(forKey: Constants.CART_KEY) {
            
        }else {
            print("veri yok")
        }
    }
    
    func getTheBasket(key: String) {
        print("bos")
    }
    
    
}
