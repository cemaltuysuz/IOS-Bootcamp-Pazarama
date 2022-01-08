//
//  ViewController.swift
//  King Fisher Usage
//
//  Created by cemal tüysüz on 8.01.2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var imageContainer: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showImage(imageName: "ayran.png")
        
    }

    @IBAction func button1_click(_ sender: Any) {
        showImage(imageName: "fanta.png")
    }
    
    @IBAction func button2_click(_ sender: Any) {
        showImage(imageName: "kofte.png")
    }
    
    func showImage(imageName:String) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(imageName)") {
            DispatchQueue.main.async {
                self.imageContainer.kf.setImage(with: url)
            }
        }
    }
}

