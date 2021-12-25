//
//  ViewController.swift
//  VIPERUsage
//
//  Created by cemal tüysüz on 25.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sonucLabel: UILabel!
    @IBOutlet weak var sayi1TextField: UITextField!
    @IBOutlet weak var sayi2TextField: UITextField!
    
    var presenterNesnesi:ViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sonucLabel.text = "0"
        Router.createModule(ref: self)
    }

    @IBAction func toplaButton(_ sender: Any) {
        if let s1 = sayi1TextField.text, let s2 = sayi2TextField.text {
            presenterNesnesi?.toplamaYap(sayi1: s1, sayi2: s2)
        }
    }
    
    @IBAction func çarpmaButton(_ sender: Any) {
        if let s1 = sayi1TextField.text, let s2 = sayi2TextField.text {
            presenterNesnesi?.carpmaYap(sayi1: s1, sayi2: s2)
        }
    }
}

extension ViewController : PresenterToViewProtocol {
    func vieweVeriGonder(sonuc: String) {
        sonucLabel.text = sonuc
    }
}

