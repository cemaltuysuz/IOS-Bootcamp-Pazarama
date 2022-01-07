//
//  AnasayfaInteractor.swift
//  KisilerUygulamasi
//
//  Created by Kasım Adalan on 27.12.2021.
//

import Foundation
import Alamofire

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumKisileriAl() {
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php",method: .get).responseJSON{response in
            
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(KisiCevap.self, from: data)
                    
                    if let kisilerListesi = cevap.kisiler {
                        self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: kisilerListesi)

                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    func kisiAra(aramaKelimesi: String) {
        let parameters:Parameters = ["kisi_ad": aramaKelimesi]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php", method: .post, parameters: parameters).responseJSON{ response in
            
            if let data = response.data {
                
                do{
                    let cevap = try JSONDecoder().decode(KisiCevap.self, from: data)
                    if let kisiListesi = cevap.kisiler {
                        
                        self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: kisiListesi)
                        
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func kisiSil(kisi_id: Int) {
        let parameters:Parameters = ["kisi_id": kisi_id]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php", method: .post, parameters: parameters).responseJSON{ response in
            
            if let data = response.data {
                do{
                    
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                        self.tumKisileriAl()
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
