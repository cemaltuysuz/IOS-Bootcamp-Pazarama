//
//  AnasayfaProtocols.swift
//  KisilerUygulamasi
//
//  Created by Kasım Adalan on 27.12.2021.
//

import Foundation

//Ana protocol
protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumKisileriAl()
    func kisiAra(aramaKelimesi:String)
    func kisiSil(kisi:KisilerModel)
}

//Ana protocol
protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}
    
    func kisileriYukle()
    func ara(aramaKelimesi:String)
    func sil(kisi:KisilerModel)
}

//Taşıyıcı protocol
protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(kisilerListesi:Array<KisilerModel>)
}

//Taşıyıcı Protocol
protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(kisilerListesi:Array<KisilerModel>)
}

//Router protocol
protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnasayfaVC)
}
