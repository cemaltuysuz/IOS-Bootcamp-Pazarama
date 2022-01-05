//
//  AnasayfaInteractor.swift
//  KisilerUygulamasi
//
//  Created by Kasım Adalan on 27.12.2021.
//

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumKisileriAl() {
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        URLSession.shared.dataTask(with: url){ (data,response,error) in
            
            if error != nil || data == nil {
                print("hata")
                return
            }
            do{
                let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data!)
                
                var liste = [Kisiler]()
                if let gelenListe = cevap.kisiler {
                    liste = gelenListe
                }
                self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
                
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func kisiAra(aramaKelimesi: String) {
        print("Arama sonucu : \(aramaKelimesi)")
    }
    
    func kisiSil(kisi_id: Int) {
        print("\(kisi_id) silindi")
    }
}
