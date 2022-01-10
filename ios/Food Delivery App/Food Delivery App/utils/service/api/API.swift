//
//  API.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import Foundation
import Alamofire

class API : APIProtocol {
    
    static let shared = API()
    
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
    
    func addToCart(params: Parameters, completionHandler: @escaping (Resource<SimpleResponse>) -> Void) {
        // Loading
        completionHandler(Resource<SimpleResponse>(status: .LOADING, data: nil, message: nil))
        
        let request = AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params)
        
        request.responseJSON{response in
            // Check Data
            if let incData = response.data {
                do{
                    let resp = try JSONDecoder().decode(SimpleResponse.self, from: incData)
                    completionHandler(Resource<SimpleResponse>(status: .SUCCESS, data: resp, message: "Success"))
                }catch{
                    completionHandler(Resource<SimpleResponse>(status: .ERROR, data: nil, message: error.localizedDescription))
                }
            }else {
                completionHandler(Resource<SimpleResponse>(status: .ERROR, data: nil, message: "Data is null"))
            }
        }
    }
    
    
}
