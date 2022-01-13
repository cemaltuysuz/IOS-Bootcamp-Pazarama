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
    
    
    func saveTimeForFoods(time: Int) {
        ud.set(time, forKey: Constants.FOOD_REFRESH_KEY)
    }
    
    func getSaveTimeForFoods() -> Int {
        return ud.integer(forKey: Constants.FOOD_REFRESH_KEY)
    }
}
