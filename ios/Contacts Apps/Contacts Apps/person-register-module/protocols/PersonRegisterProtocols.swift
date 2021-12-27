//
//  PersonRegisterProtocols.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

protocol PresenterToInteractorPersonRegisterProtocol {
    func insertPerson(personName:String,personNum:String)
}

protocol ViewToPresenterPersonRegisterProtocol {
    var personRegisterInteractor:PresenterToInteractorPersonRegisterProtocol? {get set}
    func insertThePerson(personName:String,personNum:String)
}

protocol PresenterToRouterPersonRegisterProtocol {
    static func createModule(ref:PersonRegistrationVC)
}

