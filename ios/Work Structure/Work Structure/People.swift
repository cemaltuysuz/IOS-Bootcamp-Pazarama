//
//  People.swift
//  Work Structure
//
//  Created by cemal tüysüz on 12.12.2021.
//

import Foundation

class People {
    var personId:Int?
    var personName:String?
    var personAge:Int?
    var personHeight:Double?
    init() {
    }
    init(personId:Int,personName:String,personAge:Int,personHeight:Double) {
        self.personId = personId
        self.personName = personName
        self.personAge = personAge
        self.personHeight = personHeight
    }
}
