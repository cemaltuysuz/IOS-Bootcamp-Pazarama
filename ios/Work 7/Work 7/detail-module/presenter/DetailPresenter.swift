//
//  DetailPresenter.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

class DetailPresenter : ViewToPresenterDetailProtocol {
    var detailInteractor: PresenterToInteractorDetailProtocol?
    
    func updateTheResponsibility(resp: Responsibility) {
        detailInteractor?.updateResponsibility(resp: resp)
    }
    
    
}
