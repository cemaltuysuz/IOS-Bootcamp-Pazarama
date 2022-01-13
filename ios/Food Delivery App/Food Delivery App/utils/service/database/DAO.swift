//
//  Dao.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 12.01.2022.
//

import Foundation

class DAO : DAOProtocol {
    
    let db:FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseUrl = URL(fileURLWithPath: targetPath).appendingPathComponent("FoodDB.sqlite")
        db = FMDatabase(path: databaseUrl.path)
    }
    
    static let shared = DAO()
    
    func insertAllFood(foods: [Yemekler]) {
        deleteFoods()
        
        self.db?.open()
        for food in foods {
            do{
               try self.db?.executeUpdate("INSERT INTO Food (yemek_id,yemek_adi,yemek_resim_adi,yemek_fiyat) VALUES (?,?,?,?)", values: [food.yemek_id!,food.yemek_adi!,food.yemek_resim_adi!,food.yemek_fiyat!])
              }catch{
                  print(error.localizedDescription)
            }
        }
        self.db?.close()
    }
    
    func deleteFoods() {
        db?.open()
                do{
                    try db?.executeUpdate("DELETE FROM Food", values: nil)
                }catch{
                    print(error.localizedDescription)
                }
                db?.close()
    }
    
    func getFoods(completionHandler: @escaping ([Yemekler]) -> Void) {
        var foodList = [Yemekler]()
               
               db?.open()
               
               do{
                   let c = try db!.executeQuery("SELECT * FROM Food", values: nil)
                   
                   while c.next() {
                       let food = Yemekler(yemek_id: c.string(forColumn: "yemek_id")!,
                                           yemek_adi: c.string(forColumn: "yemek_adi")!,
                                           yemek_resim_adi: c.string(forColumn: "yemek_resim_adi")!,
                                           yemek_fiyat: c.string(forColumn: "yemek_fiyat")!)
                       foodList.append(food)
                   }
                   completionHandler(foodList)
               }catch{
                   print(error.localizedDescription)
               }
               
               db?.close()
    }
    
    func searchFood(searchText: String, completionHandler: @escaping ([Yemekler]) -> Void) {
        var foodList = [Yemekler]()
               
        db?.open()
                
                do{
                    let c = try db!.executeQuery("SELECT * FROM Food WHERE Food.yemek_adi  like '%\(searchText)%'", values: nil)
                    
                    while c.next() {
                        let food = Yemekler(yemek_id: c.string(forColumn: "yemek_id")!,
                                            yemek_adi: c.string(forColumn: "yemek_adi")!,
                                            yemek_resim_adi: c.string(forColumn: "yemek_resim_adi")!,
                                            yemek_fiyat: c.string(forColumn: "yemek_fiyat")!)
                        foodList.append(food)
                    }
                    completionHandler(foodList)
                }catch{
                    print(error.localizedDescription)
                }
                db?.close()
    }
    
    
}
