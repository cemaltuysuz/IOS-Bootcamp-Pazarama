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
}

protocol PresenterToInteractorFood {
    var presenter:InteractorToPresenterFood? {get set}
    
}

protocol InteractorToPresenterFood {
}

protocol PresenterToViewFood {
    
}

protocol PresenterToRouterFood {
    static func createModule(ref:MealsVC)
}
