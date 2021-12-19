//
//  Product.swift
//  AdvancedTableView
//
//  Created by cemal tüysüz on 19.12.2021.
//

import Foundation

class Product{
    var productId:Int?
    var productName:String?
    var productImage:String?
    var productPrice:Double?
    
    init(){
        
    }
    init(productId:Int,productName:String,productImage:String,productPrice:Double){
        self.productId     = productId
        self.productName   = productName
        self.productImage  = productImage
        self.productPrice  = productPrice
    }
}


