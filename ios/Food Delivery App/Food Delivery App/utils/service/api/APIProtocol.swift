//
//  APIProtocol.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import Foundation

protocol APIProtocol {
    
    func allFoods(completionHandler: @escaping (Resource<YemeklerCevap>) -> Void)
}
