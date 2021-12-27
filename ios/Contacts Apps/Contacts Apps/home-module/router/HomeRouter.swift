//
//  HomeRouter.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

class HomeRouter : PresenterToRouterProtocol {
    
    static func createModule(ref: HomeVC) {
        let presenter = HomePresenter()
        
        ref.homePresenter = presenter
        ref.homePresenter?.homeInteractor = HomeInteractor()
        ref.homePresenter?.homeInteractor?.homePresenter = presenter
        
        ref.homePresenter?.homeView = ref
    }
}
