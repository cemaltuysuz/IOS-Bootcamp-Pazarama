//
//  UserDefaultProtocol.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 12.01.2022.
//

import Foundation

protocol UserDefaultProtocol {
            
    func saveTimeForFoods(time:Int)
    func getSaveTimeForFoods() -> Int
}
