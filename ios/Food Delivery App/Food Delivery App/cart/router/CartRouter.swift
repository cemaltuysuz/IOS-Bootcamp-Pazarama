//
//  CartRouter.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 11.01.2022.
//

import Foundation

class CartRouter : PresenterToRouterCartProtocol {
    static func createModule(ref: CartVC) {
        
        let presenter = CartPresenter()
        
        ref.presenter = presenter
        ref.presenter?.view = ref
        ref.presenter?.interactor = CartInteractor()
        ref.presenter?.interactor?.presenter = presenter
    }
    
    
}
