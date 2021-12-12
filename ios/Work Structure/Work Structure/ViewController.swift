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
    
    @IBAction func startButton(_ sender: Any) {
        let person = People(personId: 1, personName: "Cemal", personAge: 21, personHeight: 1.76)
        performSegue(withIdentifier: "homeToGameSC", sender: person)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToGameSC" {
            print("Go to game screen")
            
            if let data = sender as? People {
                print(data)
                let targetVC = segue.destination as! GameScreen
                targetVC.person = data
            }
        }
    }
}

