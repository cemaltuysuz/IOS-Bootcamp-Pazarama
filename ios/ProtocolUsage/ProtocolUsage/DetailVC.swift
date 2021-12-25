//
//  DetailVC.swift
//  ProtocolUsage
//
//  Created by cemal tüysüz on 25.12.2021.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var dataInput: UITextField!
    var myProtocol:DetailDataTransferProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendDataButton(_ sender: Any) {
        if let p = myProtocol {
            if let s:String = dataInput.text {
                p.dataTransfer(data: s)
            }
        }
    }
}
