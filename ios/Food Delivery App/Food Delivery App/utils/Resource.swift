//
//  Resource.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import Foundation

class Resource <T : Codable> {
    
    var status:Status?
    var data:T?
    var message:String?
    
    init(){}
    
    init(status:Status, data:T?, message:String?){
        self.status = status
        self.data = data
        self.message = message
    }
}

enum Status {
    case SUCCESS
    case ERROR
    case LOADING
}
