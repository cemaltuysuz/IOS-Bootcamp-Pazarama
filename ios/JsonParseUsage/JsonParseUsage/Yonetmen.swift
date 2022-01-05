//
//  Yonetmen.swift
//  JsonParseUsage
//
//  Created by cemal tüysüz on 3.01.2022.
//

import Foundation

class Yonetmen : Codable {
    var yonetmen_id:String?
    var yonetmen_ad:String?
    
    init(){}
    
    init(yonetmen_id:String, yonetmen_ad:String){
        self.yonetmen_id = yonetmen_id
        self.yonetmen_ad = yonetmen_ad
    }
}
