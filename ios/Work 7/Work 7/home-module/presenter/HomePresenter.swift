//
//  HomePresenter.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

class HomePresenter : ViewToPresenterHomeProtocol, InteractorToPresenterHomeProtocol {
    
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    
    // by view
    func getAllResponsibilities() {
        interactor?.getResponsibilities()
    }
    
    // by view
    func searchTheResponsibility(word: String) {
        interactor?.searchResponsibility(word: word)
    }
    
    // by view
    func deleteTheResponsibility(responsibilityId: Int) {
        interactor?.deleteResponsibility(responsibilityId: responsibilityId)
    }
    
    // by interactor
    func listToPresenter(list: Array<Responsibility>) {
        view?.listToView(list: list)
    }
    
}
