//
//  Responsibility.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

class Responsibility {
    var responsibilityId:Int?
    var responsibility:String?
    
    init(){
        
    }
    
    init(responsibilityId:Int,responsibility:String) {
        self.responsibilityId = responsibilityId
        self.responsibility = responsibility
    }
}
