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
    func searchFood(searchText:String)
}

protocol PresenterToInteractorFood {
    var presenter:InteractorToPresenterFood? {get set}
    
    func searchFood(searchText:String)
    func getFoods()
}

protocol InteractorToPresenterFood {
    func foodsToPresenter(yemekler:[Yemekler])
    func indicatorVisibility(bool:Bool)
    
    func searchResults(results:[Yemekler])
}

protocol PresenterToViewFood {
    func foodsToView(yemekler:[Yemekler])
    func indicatorVisibility(bool:Bool)
    func searchResults(results:[Yemekler])
}

protocol PresenterToRouterFood {
    static func createModule(ref:FoodVC)
}
