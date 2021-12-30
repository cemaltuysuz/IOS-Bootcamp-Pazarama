//
//  DetailInteractor.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

class DetailInteractor : PresenterToInteractorDetailProtocol {
    func updateResponsibility(resp: Responsibility) {
        print("updateeee \(resp.responsibility!)")
    }
}
