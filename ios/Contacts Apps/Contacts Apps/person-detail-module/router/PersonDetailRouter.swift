//
//  PersonDetailRouter.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

class PersonDetailRouter : PresenterToRouterPersonDetailProtocol {
    static func createModule(ref: PersonDetailsVC) {
        ref.personDetailPresenter = PersonDetailPresenter()
        ref.personDetailPresenter?.personDetailInteractor = PersonDetailInteractor()
    }
    
    
}
