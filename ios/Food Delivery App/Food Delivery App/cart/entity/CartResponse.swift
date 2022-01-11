//
//  CartResponse.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 11.01.2022.
//

import Foundation

struct CartResponse : Codable {
    var sepet_yemekler:[Cart]?
    var success:Int?
}
