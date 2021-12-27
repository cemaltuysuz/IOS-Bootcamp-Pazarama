//
//  PersonRegisterInteractor.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

class PersonRegisterInteractor : PresenterToInteractorPersonRegisterProtocol {
    
    func insertPerson(personName: String, personNum: String) {
        print("Kisi (from interactor) \(personName) \(personNum)")
    }
}
