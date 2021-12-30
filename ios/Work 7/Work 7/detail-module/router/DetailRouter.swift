//
//  DetailRouter.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

class DetailRouter : PresenterToRouterDetailProtocol {
    
    static func createModule(ref: DetailVC) {
        ref.detailPresenter = DetailPresenter()
        ref.detailPresenter?.detailInteractor = DetailInteractor()
    }
    
}
