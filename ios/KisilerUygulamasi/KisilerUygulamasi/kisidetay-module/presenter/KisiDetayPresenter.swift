//
//  KisiDetayPresenter.swift
//  KisilerUygulamasi
//
//  Created by Kasım Adalan on 27.12.2021.
//

import Foundation

class KisiDetayPresenter : ViewToPresenterKisiDetayProtocol {
    var kisiDetayInteractor: PresenterToInteractorKisiDetayProtocol?
    
    func guncelle(kisi: KisilerModel, kisi_ad: String, kisi_tel: String) {
        kisiDetayInteractor?.kisiGuncelle(kisi: kisi, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
}
