//
//  API.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import Foundation
import Alamofire

class API : APIProtocol {
    func allFoods(completionHandler: @escaping (Resource<YemeklerCevap>) -> Void) {
        
        let request = AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")
        
        request.responseJSON{response in
            // Loading
            completionHandler(Resource<YemeklerCevap>(status: .LOADING, data: nil, message: nil))
            // Check Data
            if let incData = response.data {
                do{
                    let resp = try JSONDecoder().decode(YemeklerCevap.self, from: incData)
                    completionHandler(Resource<YemeklerCevap>(status: .SUCCESS, data: resp, message: "Success"))
                }catch{
                    completionHandler(Resource<YemeklerCevap>(status: .ERROR, data: nil, message: error.localizedDescription))
                }
            }else {
                completionHandler(Resource<YemeklerCevap>(status: .ERROR, data: nil, message: "Data is null"))
            }
        }
    }
    
    
    static let shared = API()

}
