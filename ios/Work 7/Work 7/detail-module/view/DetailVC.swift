//
//  DetailVC.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var detailTextField: UITextField!
    var resp:Responsibility?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let r = resp {
            detailTextField.text = r.responsibility!
        }
    }
    
    @IBAction func updateButton(_ sender: Any) {
        
    }
}
