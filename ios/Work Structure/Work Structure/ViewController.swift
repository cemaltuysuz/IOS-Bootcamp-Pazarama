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
        print("DidLoad is runned")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("Will Appear is runned")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear is runned")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear is runned")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear is runned")
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

