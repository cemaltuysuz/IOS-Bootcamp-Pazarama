//
//  FoodPresenter.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import Foundation

class FoodPresenter : InteractorToPresenterFood,ViewToPresenterFood {
    var interactor: PresenterToInteractorFood?
    var view: PresenterToViewFood?
    
    func foodsToPresenter(yemekler: [Yemekler]) {
        view?.foodsToView(yemekler: yemekler)
    }
    
    func indicatorVisibility(bool: Bool) {
        view?.indicatorVisibility(bool: bool)
    }
    
    func getAllFoods() {
        interactor?.getFoods()
    }
    
}
