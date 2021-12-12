//
//  ViewController.swift
//  Work Structure
//
//  Created by cemal tüysüz on 12.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func myButton(_ sender: Any) {
        count = count + 1
        myLabel.text = String(count)
    }
    
}

