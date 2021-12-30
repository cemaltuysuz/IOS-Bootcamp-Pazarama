//
//  HomeRouter.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

class HomeRouter : PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeVC) {
        let presenter = HomePresenter()
        
        ref.presenter = presenter
        ref.presenter?.view = ref
        ref.presenter?.interactor = HomeInteractor()
        ref.presenter?.interactor?.presenter = presenter
    }
}
