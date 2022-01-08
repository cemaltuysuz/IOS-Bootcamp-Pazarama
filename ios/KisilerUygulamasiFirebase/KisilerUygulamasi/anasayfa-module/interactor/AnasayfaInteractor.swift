//
//  AnasayfaInteractor.swift
//  KisilerUygulamasi
//
//  Created by Kasım Adalan on 27.12.2021.
//

import Foundation
import Firebase

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    var ref = Database.database().reference()
    
    func tumKisileriAl() {
        ref.child("kisiler").observe(.value){(snapshot) in
            var liste = [Kisiler]()
            
            if let gelenVeri = snapshot.value as? [String:AnyObject]{
                
                for satirBilgisi in gelenVeri {
                    
                    if let dic = satirBilgisi.value as? NSDictionary {
                        let kisi_id = satirBilgisi.key
                        let kisi_ad = dic["kisi_ad"] as? String ?? ""
                        let kisi_tel = dic["kisi_tel"] as? String ?? ""
                        
                        let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                        liste.append(kisi)
                    }
                }
            }
            self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
            
        }
        
    }
    
    func kisiAra(aramaKelimesi: String) {
        ref.child("kisiler").observe(.value){(snapshot) in
            var liste = [Kisiler]()
            
            if let gelenVeri = snapshot.value as? [String:AnyObject]{
                
                for satirBilgisi in gelenVeri {
                    
                    if let dic = satirBilgisi.value as? NSDictionary {
                        let kisi_id = satirBilgisi.key
                        let kisi_ad = dic["kisi_ad"] as? String ?? ""
                        let kisi_tel = dic["kisi_tel"] as? String ?? ""
                        
                        if kisi_ad.lowercased().contains(aramaKelimesi.lowercased()){
                            let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                            liste.append(kisi)
                        }
                        
                    }
                }
            }
            self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
            
        }
    }
    
    func kisiSil(kisi_id: String) {
        ref.child("kisiler").child(kisi_id).removeValue()
    }
}
