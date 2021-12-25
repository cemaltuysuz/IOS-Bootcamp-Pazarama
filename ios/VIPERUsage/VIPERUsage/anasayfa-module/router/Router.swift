//
//  Router.swift
//  VIPERUsage
//
//  Created by cemal tüysüz on 25.12.2021.
//

import Foundation

class Router : PresenterToRouterProtocol {
    static func createModule(ref: ViewController) {
        let p = Presenter()
        // View sınıfı için oluşturulan Presenter nesnesi
        ref.presenterNesnesi = p
        
        // Presenter Sınıfı için oluşturulan Interactor ve View nesneleri
        ref.presenterNesnesi?.interactor = Interactor()
        ref.presenterNesnesi?.view = ref
        
        // Interactor değişkeni
        ref.presenterNesnesi?.interactor?.presenter = p
    }
}
