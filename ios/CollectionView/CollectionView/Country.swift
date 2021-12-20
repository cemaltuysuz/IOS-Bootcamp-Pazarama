//
//  Country.swift
//  CollectionView
//
//  Created by cemal tüysüz on 20.12.2021.
//

import Foundation

class Country {
    var countryId:Int?
    var countryName:String?
    var countryCapital:String?
    
    init(){
    }
    
    init(countryId:Int,countryName:String,countryCapital:String){
        self.countryId      = countryId
        self.countryName    = countryName
        self.countryCapital = countryCapital
    }
}
