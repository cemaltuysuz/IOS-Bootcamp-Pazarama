//
//  KisiKayitInteractor.swift
//  KisilerUygulamasi
//
//  Created by Kasım Adalan on 27.12.2021.
//

import Foundation
import Firebase

class KisiKayitInteractor : PresenterToInteractorKisiKayitProtocol {
    var ref = Database.database().reference()
    func kisiEkle(kisi_ad: String, kisi_tel: String) {
        ref.child("kisiler").childByAutoId().setValue(
            ["kisi_id":"","kisi_ad":kisi_ad,"kisi_tel":kisi_tel])
    }
}
