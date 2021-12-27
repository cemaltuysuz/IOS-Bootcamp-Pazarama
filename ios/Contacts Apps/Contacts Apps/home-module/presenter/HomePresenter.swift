//
//  HomePresenter.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

class HomePresenter : ViewToPresenterHomeProtocol, InteractorToPresenterHomeProtocol {
    
    var homeInteractor: PresenterToInteractorHomeProtocol?
    var homeView: PresenterToViewHomeProtocol?
    
    func getPeople() {
        homeInteractor?.getAllPerson()
    }
    
    func searchThePerson(word: String) {
        homeInteractor?.searchPerson(word: word)
    }
    
    func deleteThePerson(personId: Int) {
        homeInteractor?.deletePerson(personId: personId)
    }
    
    func personListToPresenter(personList: Array<Person>) {
        homeView?.personListToView(personList: personList)
    }
        
}

