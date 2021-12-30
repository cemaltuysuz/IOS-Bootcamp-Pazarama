//
//  CreatePresenter.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

class CreatePresenter : ViewToPresenterCreateProtocol {
    
    var interactor: PresenterToInteractorCreateProtocol?
    
    func createTheResponsibility(content: String) {
        interactor?.createResponsbility(content: content)
    }
    

}
