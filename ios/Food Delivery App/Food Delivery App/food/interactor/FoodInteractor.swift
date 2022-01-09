//
//  FoodInteractor.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import Foundation

class FoodInteractor : PresenterToInteractorFood {
    var presenter: InteractorToPresenterFood?
    let api:APIProtocol = API.shared
    
    func getFoods() {
        api.allFoods{ response in
            switch response.status {
            case .SUCCESS :
                if let data = response.data?.yemekler {
                    self.presenter?.indicatorVisibility(bool: false)
                    self.presenter?.foodsToPresenter(yemekler: data)
                }
                break
            case .ERROR :
                if let data = response.message {
                    print(data)
                    self.presenter?.indicatorVisibility(bool: false)
                }
                break
                
            case .LOADING :
                self.presenter?.indicatorVisibility(bool: true)
                break
                
            default :
                break
            }
        }
    }
}
