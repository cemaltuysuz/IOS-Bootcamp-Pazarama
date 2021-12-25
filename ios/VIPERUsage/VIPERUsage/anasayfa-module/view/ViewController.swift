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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sonucLabel.text = "0"
    }

    @IBAction func toplaButton(_ sender: Any) {
        if let s1 = sayi1TextField.text, let s2 = sayi2TextField.text {
            if let sayi1 = Int(s1), let sayi2 = Int(s2){
                let toplam = sayi1 + sayi2
                sonucLabel.text = String(toplam)
            }
        }
    }
    
    @IBAction func çarpmaButton(_ sender: Any) {
        if let s1 = sayi1TextField.text, let s2 = sayi2TextField.text {
            if let sayi1 = Int(s1), let sayi2 = Int(s2){
                let toplam = sayi1 * sayi2
                sonucLabel.text = String(toplam)
            }
        }
    }
}

