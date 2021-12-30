//
//  DetailProtocols.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

protocol ViewToPresenterDetailProtocol {
    var detailInteractor:PresenterToInteractorDetailProtocol? {get set}
    func updateTheResponsibility(resp:Responsibility)
}

protocol PresenterToInteractorDetailProtocol {
    func updateResponsibility(resp:Responsibility)
}

protocol PresenterToRouterDetailProtocol {
    static func createModule(ref:DetailVC)
}
