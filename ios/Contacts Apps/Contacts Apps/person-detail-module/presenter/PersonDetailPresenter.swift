//
//  PersonDetailPresenter.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

class PersonDetailPresenter : ViewToPresenterPersonDetailProtocol {
    var personDetailInteractor: PresenterToInteractorPersonDetailProtocol?
    
    func updateThePerson(personId: Int, personName: String, personNum: String) {
        personDetailInteractor?.updatePerson(personId: personId, personName: personName, personNum: personNum)
    }
    
}
