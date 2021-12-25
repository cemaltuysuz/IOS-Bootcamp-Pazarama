//
//  ViewController.swift
//  ProtocolUsage
//
//  Created by cemal tüysüz on 25.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var showDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goDetailButton(_ sender: Any) {
        performSegue(withIdentifier: "toDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let targetVC = segue.destination as! DetailVC
            targetVC.myProtocol = self
        }
    }
    
}

extension ViewController : DetailDataTransferProtocol {
    func dataTransfer(data: String) {
        showDataLabel.text = data
    }
}

