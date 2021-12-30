//
//  CreateProtocols.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

protocol ViewToPresenterCreateProtocol {
    var interactor:PresenterToInteractorCreateProtocol? {get set}
    
    func createTheResponsibility(content:String)
}

protocol PresenterToInteractorCreateProtocol {
    
    func createResponsbility(content:String)
}

protocol PresenterToRouterCreateProtocol {
    
    static func createModule(ref:CreateVC)
}

