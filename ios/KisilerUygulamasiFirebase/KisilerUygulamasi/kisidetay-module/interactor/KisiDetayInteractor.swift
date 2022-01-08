//
//  KisiDetayInteractor.swift
//  KisilerUygulamasi
//
//  Created by Kasım Adalan on 27.12.2021.
//

import Foundation
import Firebase

class KisiDetayInteractor : PresenterToInteractorKisiDetayProtocol {
    var ref = Database.database().reference()
    
    func kisiGuncelle(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        ref.child("kisiler").child(kisi_id).updateChildValues(["kisi_ad":kisi_ad, "kisi_tel":kisi_tel])
    }
}
