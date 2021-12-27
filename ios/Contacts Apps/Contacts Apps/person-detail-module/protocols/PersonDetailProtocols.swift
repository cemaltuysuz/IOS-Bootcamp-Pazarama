//
//  PersonDetailProtocols.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

protocol PresenterToInteractorPersonDetailProtocol {
    func updatePerson(personId:Int,personName:String,personNum:String)
}

protocol ViewToPresenterPersonDetailProtocol {
    var personDetailInteractor:PresenterToInteractorPersonDetailProtocol? {get set}
    func updateThePerson(personId:Int,personName:String,personNum:String)
}

protocol PresenterToRouterPersonDetailProtocol {
    static func createModule(ref:PersonDetailsVC)
}
