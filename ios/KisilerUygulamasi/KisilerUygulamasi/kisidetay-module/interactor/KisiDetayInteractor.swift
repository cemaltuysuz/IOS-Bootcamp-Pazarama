//
//  KisiDetayInteractor.swift
//  KisilerUygulamasi
//
//  Created by Kasım Adalan on 27.12.2021.
//

import Foundation

class KisiDetayInteractor : PresenterToInteractorKisiDetayProtocol {
    func kisiGuncelle(kisi: KisilerModel, kisi_ad: String, kisi_tel: String) {
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        
        appDelegate.saveContext()
    }
}
