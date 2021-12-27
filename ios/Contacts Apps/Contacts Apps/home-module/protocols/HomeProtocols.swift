//
//  HomeProtocols.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

// Ana Protocol
protocol PresenterToInteractorHomeProtocol {
    var homePresenter:InteractorToPresenterHomeProtocol? {get set}
    
    func getAllPerson()
    func searchPerson(word:String)
    func deletePerson(personId:Int)
}

// Ana Protocol
protocol ViewToPresenterHomeProtocol {
    var homeInteractor: PresenterToInteractorHomeProtocol? {get set}
    var homeView : PresenterToViewHomeProtocol? {get set}
    
    func getPeople()
    func searchThePerson(word:String)
    func deleteThePerson(personId:Int)
}

// Taşıyıcı Protocol
protocol InteractorToPresenterHomeProtocol {
    func personListToPresenter(personList:Array<Person>)
}

// Taşıyıcı
protocol PresenterToViewHomeProtocol {
    func personListToView(personList:Array<Person>)
}

// Router
protocol PresenterToRouterProtocol {
    static func createModule (ref:HomeVC)
}




