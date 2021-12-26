//
//  Product.swift
//  Work 6
//
//  Created by cemal tüysüz on 26.12.2021.
//

import Foundation

class Product {
    var productId:Int?
    var productImage:String?
    var productTitle:String?
    var productDescription:String?
    var productPrice:Double?
    var isShippingFree:Bool?
    var isFastDelivery:Bool
    
    init(productId:Int,productImage:String,productTitle:String,productDescription:String,productPrice:Double,isShippingFree:Bool,isFastDelivery:Bool){
        self.productId = productId
        self.productImage = productImage
        self.productTitle = productTitle
        self.productDescription = productDescription
        self.productPrice = productPrice
        self.isShippingFree = isShippingFree
        self.isFastDelivery = isFastDelivery
    }
}
