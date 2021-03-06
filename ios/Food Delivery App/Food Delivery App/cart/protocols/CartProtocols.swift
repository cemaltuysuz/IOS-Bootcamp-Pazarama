//
//  CartProtocols.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 11.01.2022.
//

import Foundation

protocol ViewToPresenterCartProtocol {
    var view:PresenterToViewCartProtocol? {get set}
    var interactor:PresenterToInteractorCartProtocol? {get set}
    
    func deleteCart()
    func deleteFoodFromCart(foodName:String)
    func getTheCart()
    func increaseAmount(cartId:Int)
    func reduceAmount(cartId:Int)
}

protocol PresenterToInteractorCartProtocol {
    var presenter:InteractorToPresenterCartProtocol? {get set}
    func deleteFoodFromCart(foodName:String)
    func getCart()
    func deleteCart()
    func increaseAmount(cartId:Int)
    func reduceAmount(cartId:Int)
}

protocol InteractorToPresenterCartProtocol {
    func cartToPresenter(items:[Cart])
}

protocol PresenterToViewCartProtocol {
    func cartToView(items:[Cart])
}

protocol PresenterToRouterCartProtocol {
    static func createModule(ref:CartVC)
}
