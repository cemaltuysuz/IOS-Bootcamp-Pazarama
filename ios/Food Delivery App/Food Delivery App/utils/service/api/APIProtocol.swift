//
//  APIProtocol.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import Foundation
import Alamofire

protocol APIProtocol {
    
    func allFoods(completionHandler: @escaping (Resource<YemeklerCevap>) -> Void)
    
    func addToCart(params:Parameters,completionHandler: @escaping (Resource<SimpleResponse>) -> Void)
    
    func getCart(params:Parameters,completionHandler: @escaping (Resource<CartResponse>) -> Void)
    
    func deleteCart(params:Parameters,completionHandler: @escaping (Resource<SimpleResponse>) -> Void)

}
