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
                    self.presenter?.cartToPresenter(items: data)
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
    
}
