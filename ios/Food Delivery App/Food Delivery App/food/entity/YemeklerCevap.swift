//
//  File.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import Foundation

struct YemeklerCevap : Codable {
    var yemekler:[Yemekler]?
    var success:Int
    
    init (yemekler:[Yemekler], success:Int){
        self.yemekler = yemekler
        self.success = success
    }
}
