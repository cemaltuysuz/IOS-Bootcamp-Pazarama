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
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!)
        istek.httpMethod = "POST"
        let postString = "kisi_ad=\(aramaKelimesi)"
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek) {(data,response,error) in
            if error != nil && data == nil {
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
    
    func kisiSil(kisi_id: Int) {
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
        istek.httpMethod = "POST"
        let postString = "kisi_id=\(kisi_id)"
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek) {(data,response,error) in
            if error != nil && data == nil {
                print("hata")
                return
            }
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                    print(json)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
        tumKisileriAl()
    }
}
