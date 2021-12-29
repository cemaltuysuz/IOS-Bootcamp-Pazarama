//
//  ViewController.swift
//  UserDefaultUsage
//
//  Created by cemal tüysüz on 29.12.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create userdefaults
        let ud = UserDefaults.standard
        
        // insert data
        ud.set("Cemal", forKey: "username")
        
        // get data
        let incomingUsername = ud.string(forKey: "username") ?? "No data"
        
        // delete data
        ud.removeObject(forKey: "username")
        
        
        
        print(incomingUsername)
    }


}

