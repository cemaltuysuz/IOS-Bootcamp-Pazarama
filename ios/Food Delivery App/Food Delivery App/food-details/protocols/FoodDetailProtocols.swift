//
//  FoodDetailProtocols.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 10.01.2022.
//

import Foundation

protocol ViewToPresenterFoodDetail {
    var view:PresenterToViewFoodDetail? {get set}
    var interactor:PresenterToInteractorFoodDetail? {get set}
    
    func addToCart(food:Yemekler, amount:Int)
}

protocol PresenterToInteractorFoodDetail {
    var presenter:InteractorToPresenterFoodDetail? {get set}
    
    func addToCart(food:Yemekler, amount:Int)
}

protocol PresenterToViewFoodDetail {
    func addToCartStatus(bool:Bool)
}

protocol InteractorToPresenterFoodDetail {
    func addToCartStatus(bool:Bool)
}

protocol PresenterToRouterFoodDetail {
    static func createModule(ref:FoodDetailVC)
}
