//
//  Interactor.swift
//  VIPERUsage
//
//  Created by cemal tüysüz on 25.12.2021.
//

import Foundation

class Interactor : PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    
    func topla(sayi1: String, sayi2: String) {
        if let sayi1 = Int(sayi1), let sayi2 = Int(sayi2){
            let toplam = sayi1 + sayi2
            presenter?.presenteraVeriGonder(sonuc: String(toplam))
        }
    }
    
    func carp(sayi1: String, sayi2: String) {
        if let sayi1 = Int(sayi1), let sayi2 = Int(sayi2){
            let carpim = sayi1 * sayi2
            presenter?.presenteraVeriGonder(sonuc: String(carpim))
        }
    }
    
    
}
