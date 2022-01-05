//
//  Kategori.swift
//  JsonParseUsage
//
//  Created by cemal tüysüz on 3.01.2022.
//

import Foundation

class Kategori : Codable {
    var kategori_id:String?
    var kategori_ad:String?
    
    init(){}
    
    init(kategori_id:String,kategori_ad:String){
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}
