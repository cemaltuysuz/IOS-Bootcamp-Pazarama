//
//  ViewController.swift
//  Tab Bar
//
//  Created by cemal tüysüz on 12.12.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.gray
        
        changeItemColor(itemAppearance: appearance.stackedLayoutAppearance)
        changeItemColor(itemAppearance: appearance.inlineLayoutAppearance)
        changeItemColor(itemAppearance: appearance.compactInlineLayoutAppearance)

        tabBarController?.tabBar.standardAppearance = appearance

    }
    
    func changeItemColor(itemAppearance:UITabBarItemAppearance){
        // Unselected status color
        itemAppearance.normal.iconColor = UIColor.white
        itemAppearance.normal.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        // Selected Status
        itemAppearance.selected.iconColor = UIColor.yellow
        itemAppearance.selected.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor:UIColor.black]
    }


}

