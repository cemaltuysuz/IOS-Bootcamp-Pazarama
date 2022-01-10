//
//  FoodDetailInteractor.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 10.01.2022.
//

import Foundation

class FoodDetailPresenter : ViewToPresenterFoodDetail, InteractorToPresenterFoodDetail {
    
    var view: PresenterToViewFoodDetail?
    var interactor: PresenterToInteractorFoodDetail?
    
    func addToCart(food: Yemekler, amount: Int) {
        interactor?.addToChart(food: food, amount: amount)
    }
}
