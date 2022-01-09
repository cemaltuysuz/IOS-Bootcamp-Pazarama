//
//  FoodInteractor.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import Foundation

class FoodInteractor : PresenterToInteractorFood {
    var presenter: InteractorToPresenterFood?
    
    func getFoods() {
        var yemekler = [Yemekler]()
        let yemek1 = Yemekler(yemek_id: "1", yemek_adi: "Iskender", yemek_resim_adi: "", yemek_fiyat: "15")
        yemekler.append(yemek1)
        presenter?.foodsToPresenter(yemekler: yemekler)
    }
}
