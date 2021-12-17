//
//  ScreenXVC.swift
//  Work 4
//
//  Created by cemal tüysüz on 17.12.2021.
//

import UIKit

class ScreenXVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func ScreenBButton(_ sender: Any) {
        performSegue(withIdentifier: "ScreenXToScreenY", sender: nil)
    }
}
