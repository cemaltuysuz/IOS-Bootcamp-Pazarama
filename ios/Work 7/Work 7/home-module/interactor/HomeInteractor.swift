//
//  HomeInteractor.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

class HomeInteractor : PresenterToInteractorHomeProtocol {
    
    var db:FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseUrl = URL(fileURLWithPath: targetPath).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: databaseUrl.path)
    }
    
    var presenter: InteractorToPresenterHomeProtocol?
    
    func getResponsibilities() {
        var tempList = [Responsibility]()
        db?.open()
        
        do{
            let cursor = try db!.executeQuery("SELECT * FROM ResponsibilityDB", values: nil)
            
            while cursor.next() {
                let resp = Responsibility(
                    responsibilityId: Int(cursor.string(forColumn: "responsibilityId"))!,
                    responsibility: cursor.string(forColumn: "responsibility")!)
                tempList.append(resp)
            }
            presenter?.listToPresenter(list: tempList)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func searchResponsibility(word: String) {
        var tempList = [Responsibility]()
        
        db?.open()
        
        do{
            let cursor = try db!.executeQuery("SELECT * FROM ResponsibilityDB WHERE responsibility like '%\(word)%'", values: nil)
            
            while cursor.next() {
                let resp = Responsibility(
                    responsibilityId: Int(cursor.string(forColumn: "responsibilityId"))!,
                    responsibility: cursor.string(forColumn: "responsibility")!)
                tempList.append(resp)
            }
            presenter?.listToPresenter(list: tempList)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func deleteResponsibility(responsibilityId: Int) {
        db?.open()
        do{
            try db?.executeUpdate("DELETE FROM ResponsibilityDB WHERE responsibilityId = ?", values: [responsibilityId])
            getResponsibilities()
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
