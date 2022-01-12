//
//  CartFood.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 11.01.2022.
//

import Foundation

struct Cart : Codable, Hashable, Equatable {
    var sepet_yemek_id:String?
    var yemek_adi:String?
    var yemek_resim_adi:String?
    var yemek_fiyat:String?
    var yemek_siparis_adet:String?
    var kullanici_adi:String?
    
    init() {
        
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(yemek_adi)
    }
    
    /*
    var hashValue: Int {
            get {
                return sepet_yemek_id!.hashValue << 15 + yemek_adi!.hashValue
            }
        } */
    
}

func ==(lhs: Cart, rhs: Cart) -> Bool {
    return lhs.yemek_adi! == rhs.yemek_adi!
}
