//
//  DAOProtocol.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 12.01.2022.
//

import Foundation

protocol DAOProtocol {
    func insertAllFood(foods:[Yemekler])
    func deleteFoods()
    func getFoods(completionHandler: @escaping ([Yemekler]) -> Void)
    func searchFood(searchText:String,completionHandler: @escaping ([Yemekler]) -> Void)
}
