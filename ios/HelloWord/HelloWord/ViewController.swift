//
//  ViewController.swift
//  HelloWord
//
//  Created by cemal tüysüz on 11.12.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Pizza"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "MainColor")!
        appearance.titleTextAttributes = [.foregroundColor:UIColor(named: "TextColor1")!,
                                          NSAttributedString.Key.font: UIFont(name: "Pacifico-Regular", size: 22)!]
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }


}

