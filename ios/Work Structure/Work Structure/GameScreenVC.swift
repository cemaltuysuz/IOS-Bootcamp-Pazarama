//
//  GameScreen.swift
//  Work Structure
//
//  Created by cemal tüysüz on 12.12.2021.
//

import UIKit

class GameScreen: UIViewController {
    
    var message:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let m = message{
            print("Incoming message : \(m)")
        }
    }
    @IBAction func finishItButton(_ sender: Any) {
        performSegue(withIdentifier: "gameToResultSC", sender: nil)
    }
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
