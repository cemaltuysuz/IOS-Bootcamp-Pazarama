//
//  Protocols.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

protocol ViewToPresenterHomeProtocol {
    var view:PresenterToViewHomeProtocol? {get set}
    var interactor:PresenterToInteractorHomeProtocol? {get set}
    
    func getAllResponsibilities()
    func searchTheResponsibility(word:String)
    func deleteTheResponsibility(responsibilityId:Int)
}

protocol PresenterToInteractorHomeProtocol {
    var presenter:InteractorToPresenterHomeProtocol? {get set}
    
    func getResponsibilities()
    func searchResponsibility(word:String)
    func deleteResponsibility(responsibilityId:Int)
}

protocol InteractorToPresenterHomeProtocol {
    func listToPresenter(list:Array<Responsibility>)
}

protocol PresenterToViewHomeProtocol {
    func listToView(list:Array<Responsibility>)
}

protocol PresenterToRouterHomeProtocol {
    static func createModule(ref:HomeVC)
}
