//
//  FoodDetailRouter.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 10.01.2022.
//

import Foundation

class FoodDetailRouter : PresenterToRouterFoodDetail {
    static func createModule(ref: FoodDetailVC) {
        let presenter = FoodDetailPresenter()
        
        ref.presenter = presenter
        ref.presenter?.interactor = FoodDetailInteractor()
        ref.presenter?.view = ref
        ref.presenter?.interactor?.presenter = presenter
    }
    
    
}
