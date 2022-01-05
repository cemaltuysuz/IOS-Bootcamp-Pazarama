//
//  Film.swift
//  JsonParseUsage
//
//  Created by cemal tüysüz on 3.01.2022.
//

import Foundation

class Filmler:Codable {
    var film_id:String?
    var film_ad:String?
    var film_yil:String?
    var film_resim:String?
    var kategori:Kategori?
    var yonetmen:Yonetmen?
}
