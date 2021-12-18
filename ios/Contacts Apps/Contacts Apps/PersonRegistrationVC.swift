//
//  PersonRegistrationVC.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 18.12.2021.
//

import UIKit

class PersonRegistrationVC: UIViewController {

    @IBOutlet weak var tfKisiAdi: UITextField!
    
    @IBOutlet weak var tfKisiTel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = tfKisiAdi.text, let kt = tfKisiTel.text {
            kayit(ad: ka, tel: kt)
        }
    }
    
    func kayit(ad:String,tel:String){
        print("Kisi \(ad) \(tel)")
    }
}
