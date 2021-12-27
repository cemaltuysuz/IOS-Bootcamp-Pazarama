//
//  PersonRegisterRouter.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

class PersonRegisterRouter : PresenterToRouterPersonRegisterProtocol {
    static func createModule(ref: PersonRegistrationVC) {
        let presenter = PersonRegisterPresenter()
        ref.personRegisterPresenter = presenter
        ref.personRegisterPresenter?.personRegisterInteractor = PersonRegisterInteractor()
        
    }
}
