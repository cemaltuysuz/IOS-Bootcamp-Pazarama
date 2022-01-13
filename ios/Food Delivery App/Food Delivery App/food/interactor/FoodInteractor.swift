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
    let dao:DAOProtocol = DAO.shared
    let ud:UserDefaultProtocol = UserDefaultService.shared
    
    func getFoods() {
        let downloadTime = ud.getSaveTimeForFoods()
        if downloadTime == 0 {
            getFoodFromAPI()
            return
        }else {
            if(currentTimeInMilliSeconds() - downloadTime < Int(Constants.FOOD_REFRESH_TIME)) {
                getFoodFromDatabase()
            }else {
                getFoodFromAPI()
            }
        }
    }
    /**
     Kullanıcı yemek aradığı  zaman bu method çalışacak. Kullanıcının search bar üzerinde girdiği metnin
     boş olup olmadığını view katmanında kontrol ediyorum. Bu kısımda aradığı yemek veritabanında olmayabilir
     bu yuzden donen listenin boş olup olmadığını kontrol ediyorum. Eğer boş ise veri bulunamadı resmini kullanıcıya göstereceğim.
     */
        
    func searchFood(searchText: String) {
        dao.searchFood(searchText: searchText, completionHandler: { data in
            if data.count > 0 {
                self.presenter?.foodsToPresenter(yemekler: data)
            }else {
                print("Bu kısımda kullanıcıya data bulunamadı hatası gösterilecek")
            }
        })
    }
    
    /**
     Protocol bunyesinde olmayan fonksiyonlar
     */
    
    func getFoodFromAPI(){
        print("Süre geçti veriler API üzerinden gelecek.")
        api.allFoods{ response in
            switch response.status {
            case .SUCCESS :
                if let data = response.data?.yemekler {
                    self.presenter?.indicatorVisibility(bool: false)
                    self.presenter?.foodsToPresenter(yemekler: data)
                    self.dao.insertAllFood(foods: data)
                    self.ud.saveTimeForFoods(time: self.currentTimeInMilliSeconds())
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
    
    func getFoodFromDatabase(){
        dao.getFoods(completionHandler: { data in
            self.presenter?.indicatorVisibility(bool: false)
            if data.count > 0 {
                print("Veriler veritabanından geldi")
                self.presenter?.foodsToPresenter(yemekler: data)
            }
            
        })
    }
    
    func currentTimeInMilliSeconds()-> Int
        {
            let currentDate = Date()
            let since1970 = currentDate.timeIntervalSince1970
            return Int(since1970 * 1000)
        }
}
