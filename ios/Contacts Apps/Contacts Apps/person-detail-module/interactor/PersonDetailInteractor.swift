//
//  PersonDetailInteractor.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

class PersonDetailInteractor : PresenterToInteractorPersonDetailProtocol {
    func updatePerson(personId: Int, personName: String, personNum: String) {
        print("Kisi update (from interactor) \(personName) \(personNum)")
    }
}
