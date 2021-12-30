//
//  DetailInteractor.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

class DetailInteractor : PresenterToInteractorDetailProtocol {
    
    var db:FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseUrl = URL(fileURLWithPath: targetPath).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: databaseUrl.path)
    }
    
    func updateResponsibility(resp: Responsibility) {
        db?.open()
        do{
            try db!.executeUpdate("UPDATE ResponsibilityDB SET responsibility = ? WHERE responsibilityId = ?", values: [resp.responsibility!,resp.responsibilityId!])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
