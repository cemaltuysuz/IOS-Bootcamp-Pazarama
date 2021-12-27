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
    var personDetailPresenter : ViewToPresenterPersonDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let p = kisi {
            tfKisiAd.text   = p.kisi_ad
            tfKisiTel.text  = p.kisi_tel
        }
        
        PersonDetailRouter.createModule(ref: self)
    }
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let p = kisi {
            if let personName = tfKisiAd.text , let personNum = tfKisiTel.text {
                personDetailPresenter?.updateThePerson(personId: p.kisi_id!, personName: personName, personNum: personNum)
            }
        }
    }
}
