//
//  ScreenYVC.swift
//  Work 4
//
//  Created by cemal tüysüz on 17.12.2021.
//

import UIKit

class ScreenYVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    @IBAction func BackToRootView(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
