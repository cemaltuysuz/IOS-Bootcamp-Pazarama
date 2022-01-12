//
//  CartInteractor.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 11.01.2022.
//

import Foundation
import Alamofire

class CartInteractor : PresenterToInteractorCartProtocol{
    var api:APIProtocol = API.shared
    var presenter: InteractorToPresenterCartProtocol?
    
    func getCart() {
        let params:Parameters = ["kullanici_adi":"cemaltysz"]
        
        api.getCart(params: params, completionHandler: { response in
            switch response.status {
            case .SUCCESS:
                if let data = response.data?.sepet_yemekler {
                    self.presenter?.cartToPresenter(items: self.mergeFoods(foods: data))
                }
                break
            case .ERROR:
                print("error")
                break
            default:
                break
            }
        })
    }
    
    func mergeFoods(foods:[Cart]) -> [Cart] {
        var mergedFoods = [Cart]()
        var setFoods = Set<Cart>()
        
        for i in foods {
            setFoods.insert(i)
        }
        
        for (element) in setFoods {
            var count = 0
            for index2 in foods {
                if element.yemek_adi! == index2.yemek_adi! {
                    count = count + Int(index2.yemek_siparis_adet!)!
                }
            }
            var food = element
            food.yemek_siparis_adet = String(count)
            mergedFoods.append(food)
        }
        return mergedFoods
    }
    
}
