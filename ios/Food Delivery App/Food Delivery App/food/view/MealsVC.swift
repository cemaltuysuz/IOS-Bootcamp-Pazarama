//
//  MealsVC.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import UIKit

class MealsVC: UIViewController {

    var presenter: ViewToPresenterFood?
    override func viewDidLoad() {
        super.viewDidLoad()
        FoodRouter.createModule(ref: self)
    }

}

extension MealsVC : PresenterToViewFood {
    
}


