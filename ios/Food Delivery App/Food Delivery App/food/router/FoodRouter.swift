//
//  FoodRouter.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import Foundation

class FoodRouter : PresenterToRouterFood {
    
    static func createModule(ref: MealsVC) {
        let presenter = FoodPresenter()
        
        ref.presenter = presenter
        ref.presenter?.interactor = FoodInteractor()
        ref.presenter?.interactor?.presenter = presenter
        ref.presenter?.view = ref
    }
}
