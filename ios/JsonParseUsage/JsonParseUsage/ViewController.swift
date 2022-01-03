//
//  ViewController.swift
//  JsonParseUsage
//
//  Created by cemal tüysüz on 3.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //kisilerJsonParse()
        filmlerJsonParse()
    }

    func kisilerJsonParse(){
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")
        URLSession.shared.dataTask(with: url!){ (data,response,error) in
            if error != nil || data == nil {
                print("Error")
                return
            }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                    
                    if let kisiler = json["kisiler"] as? [[String:Any]] {
                        for kisi in kisiler {
                            print("*********")
                            print("Kişi id : \(kisi["kisi_id"]!)")
                            print("Kişi adı : \(kisi["kisi_ad"]!)")
                            print("Kişi tel : \(kisi["kisi_tel"]!)")
                        }
                    }
                    
                    if let success = json["success"] {
                        print("********")
                        print("başarı : \(success)")
                    }
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func filmlerJsonParse(){
        let url = URL(string: "http://kasimadalan.pe.hu/filmler/tum_filmler.php")
        URLSession.shared.dataTask(with: url!){ (data,response,error) in
            if error != nil || data == nil {
                print("Error")
                return
            }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                    
                    if let filmler = json["filmler"] as? [[String:Any]] {
                        for film in filmler {
                            print("**********")
                            print("Film id : \(film["film_id"]!)")
                            print("Film adı : \(film["film_ad"]!)")
                            print("Film yıl : \(film["film_yil"]!)")
                            print("Film resim : \(film["film_resim"]!)")
                            
                            if let kategori = film["kategori"] as? [String:Any]{
                                print("kategori id : \(kategori["kategori_id"]!)")
                                print("kategori adi : \(kategori["kategori_ad"]!)")
                            }
                            
                            if let yonetmen = film["yonetmen"] as? [String:Any]{
                                print("Yonetmen id : \(yonetmen["yonetmen_id"]!)")
                                print("Yonetmen ad : \(yonetmen["yonetmen_ad"]!)")
                            }
                        }
                        
                    }
                    
                    if let success = json["success"] {
                        print("********")
                        print("Success info :\(success)")
                    }
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }

}

