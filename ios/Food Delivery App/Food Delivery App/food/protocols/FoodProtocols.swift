//
//  MealsProtocols.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import Foundation

protocol ViewToPresenterFood {
    var interactor:PresenterToInteractorFood? {get set}
    var view:PresenterToViewFood? {get set}
    
    func getAllFoods()
}

protocol PresenterToInteractorFood {
    var presenter:InteractorToPresenterFood? {get set}
    
    func getFoods()
}

protocol InteractorToPresenterFood {
    func foodsToPresenter(yemekler:[Yemekler])
    func indicatorVisibility(bool:Bool)
}

protocol PresenterToViewFood {
    func foodsToView(yemekler:[Yemekler])
    func indicatorVisibility(bool:Bool)
}

protocol PresenterToRouterFood {
    static func createModule(ref:FoodVC)
}
