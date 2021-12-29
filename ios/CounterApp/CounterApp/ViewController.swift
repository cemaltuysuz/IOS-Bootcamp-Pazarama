//
//  ViewController.swift
//  CounterApp
//
//  Created by cemal tüysüz on 29.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ud = UserDefaults.standard
        
        var counter = ud.integer(forKey: "counter")
        
        counter = counter + 1
        
        counterLabel.text = "Number of openings : \(counter)"
        ud.set(counter, forKey: "counter")
    }


}

