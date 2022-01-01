//
//  KisiDetayProtocols.swift
//  KisilerUygulamasi
//
//  Created by Kasım Adalan on 27.12.2021.
//

import Foundation

protocol PresenterToInteractorKisiDetayProtocol {
    func kisiGuncelle(kisi:KisilerModel,kisi_ad:String,kisi_tel:String)
}

protocol ViewToPresenterKisiDetayProtocol {
    var kisiDetayInteractor:PresenterToInteractorKisiDetayProtocol? {get set}
    
    func guncelle(kisi:KisilerModel,kisi_ad:String,kisi_tel:String)
}

protocol PresenterToRouterKisiDetayProtocol {
    static func createModule(ref:KisiDetayVC)
}
