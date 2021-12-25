//
//  Protocols.swift
//  VIPERUsage
//
//  Created by cemal tüysüz on 25.12.2021.
//

import Foundation

// Ana Protokol
protocol ViewToPresenterProtocol {
    var interactor:PresenterToInteractorProtocol? {get set}
    var view:PresenterToViewProtocol? {get set}
    
    func toplamaYap (sayi1:String,sayi2:String)
    func carpmaYap (sayi1:String,sayi2:String)
}

// Ana Protokol
protocol PresenterToInteractorProtocol {
    var presenter:InteractorToPresenterProtocol? {get set}
    
    func topla (sayi1:String,sayi2:String)
    func carp (sayi1:String,sayi2:String)
}

// Taşıyıcı Protokol
protocol InteractorToPresenterProtocol {
    func presenteraVeriGonder(sonuc:String)
}

// Taşıyıcı Protokol
protocol PresenterToViewProtocol {
    func vieweVeriGonder(sonuc:String)
}

// yetkilendirme
protocol PresenterToRouterProtocol {
    static func createModule(ref:ViewController)
}


