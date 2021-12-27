//
//  PersonDetailsVC.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 18.12.2021.
//

import UIKit

class PersonDetailsVC: UIViewController {

    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    var kisi:Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let p = kisi {
            tfKisiAd.text   = p.kisi_ad
            tfKisiTel.text  = p.kisi_tel
        }
    }
    @IBAction func buttonGuncelle(_ sender: Any) {
    }
}
