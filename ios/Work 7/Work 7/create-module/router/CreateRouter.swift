//
//  CreateRouter.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

class CreateRouter : PresenterToRouterCreateProtocol {
    static func createModule(ref: CreateVC) {
        ref.presenter = CreatePresenter()
        ref.presenter?.interactor = CreateInteractor()
    }
}
