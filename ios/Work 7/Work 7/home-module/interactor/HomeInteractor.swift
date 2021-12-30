//
//  HomeInteractor.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

class HomeInteractor : PresenterToInteractorHomeProtocol {
    
    var presenter: InteractorToPresenterHomeProtocol?
    
    func getResponsibilities() {
        var tempList = [Responsibility]()
        tempList.append(Responsibility(responsibilityId: 1, responsibility: "deneme1"))
        tempList.append(Responsibility(responsibilityId: 2, responsibility: "deneme2"))
        tempList.append(Responsibility(responsibilityId: 3, responsibility: "deneme3"))
        tempList.append(Responsibility(responsibilityId: 4, responsibility: "deneme4"))
        tempList.append(Responsibility(responsibilityId: 5, responsibility: "deneme5"))
        presenter?.listToPresenter(list: tempList)
    }
    
    func searchResponsibility(word: String) {
        print("word is : \(word)")
    }
    
    func deleteResponsibility(responsibilityId: Int) {
        print("Delete item : \(responsibilityId)")
    }
}
