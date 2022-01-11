//
//  FoodDetailInteractor.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 10.01.2022.
//

import Foundation
import Alamofire

class FoodDetailInteractor : PresenterToInteractorFoodDetail {
    
    var presenter: InteractorToPresenterFoodDetail?
    var api:APIProtocol = API.shared
    
    func addToCart(food: Yemekler, amount: Int) {
        let params:Parameters = ["yemek_adi":food.yemek_adi!, "yemek_resim_adi":food.yemek_resim_adi!, "yemek_fiyat":food.yemek_fiyat!, "yemek_siparis_adet":amount, "kullanici_adi":"cemaltysz"]
        
        api.addToCart(params: params) {response in
            
            switch response.status {
            case .SUCCESS:
                self.presenter?.addToCartStatus(bool: true)
                break
            case .ERROR:
                self.presenter?.addToCartStatus(bool: false)
                break
            default:
                break
            }
        }
    }
}
