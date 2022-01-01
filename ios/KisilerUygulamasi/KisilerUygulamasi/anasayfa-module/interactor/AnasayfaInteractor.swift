//
//  AnasayfaInteractor.swift
//  KisilerUygulamasi
//
//  Created by Kasım Adalan on 27.12.2021.
//

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    let context = appDelegate.persistentCotainer.viewContext

    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    func tumKisileriAl() {
        do{
            let liste = try context.fetch(KisilerModel.fetchRequest())
            anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
        }catch{}
    }
    
    func kisiAra(aramaKelimesi: String) {
        let fr = KisilerModel.fetchRequest()
        fr.predicate = NSPredicate(format: "kisi_ad CONTAINS %@", aramaKelimesi)
        
        do{
            let liste = try context.fetch(fr)
            anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
        }catch{
            
        }
    }
    
    func kisiSil(kisi: KisilerModel) {
        context.delete(kisi)
        appDelegate.saveContext()
        tumKisileriAl()
    }
}
