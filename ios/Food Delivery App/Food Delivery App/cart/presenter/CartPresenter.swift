//
//  CartPresenter.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 11.01.2022.
//

import Foundation

class CartPresenter : ViewToPresenterCartProtocol, InteractorToPresenterCartProtocol {

    
    var view: PresenterToViewCartProtocol?
    var interactor: PresenterToInteractorCartProtocol?

    func increaseAmount(cartId: Int) {
        interactor?.increaseAmount(cartId: cartId)
    }
    
    func reduceAmount(cartId: Int) {
        interactor?.reduceAmount(cartId: cartId)
    }
    
    func getTheCart() {
        self.interactor?.getCart()
    }
    
    func cartToPresenter(items: [Cart]) {
        self.view?.cartToView(items: items)
    }
    
    func deleteCart() {
        interactor?.deleteCart()
    }
    
    func deleteFoodFromCart(foodName: String) {
        interactor?.deleteFoodFromCart(foodName: foodName)
    }
    
    
}
