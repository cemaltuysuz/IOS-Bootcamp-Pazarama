//
//  GameScreen.swift
//  Work Structure
//
//  Created by cemal tüysüz on 12.12.2021.
//

import UIKit

class GameScreen: UIViewController {
    
    var person:People?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let m = person{
            print("ID : \(m.personId)")
            print("NAME : \(m.personName)")
            print("AGE : \(m.personAge)")
            print("HEIGHT : \(m.personHeight)")
        }
    }
    @IBAction func finishItButton(_ sender: Any) {
        performSegue(withIdentifier: "gameToResultSC", sender: nil)
    }
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
