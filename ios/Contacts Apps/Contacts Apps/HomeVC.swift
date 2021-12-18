//
//  HomeVC.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 18.12.2021.
//

import UIKit

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func denemeButton(_ sender: Any) {
        let kisi = Person(kisi_id: 1, kisi_ad: "cEMAL", kisi_tel: "123456")
        performSegue(withIdentifier: "toDetay", sender: kisi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("a")
        if segue.identifier == "toDetay" {
            let kisi = sender as? Person
            let targetVC = segue.destination as! PersonDetailsVC
            targetVC.kisi = kisi
        }
    }
    
}
