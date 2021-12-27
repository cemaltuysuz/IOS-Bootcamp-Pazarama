//
//  PersonRegisterPresenter.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

class PersonRegisterPresenter : ViewToPresenterPersonRegisterProtocol {
    
    var personRegisterInteractor: PresenterToInteractorPersonRegisterProtocol?
    
    func insertThePerson(personName: String, personNum: String) {
        personRegisterInteractor?.insertPerson(personName: personName, personNum: personNum)
    }
    
    
}
