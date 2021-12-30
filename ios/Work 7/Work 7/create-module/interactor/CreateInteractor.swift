//
//  CreateInteractor.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import Foundation

class CreateInteractor : PresenterToInteractorCreateProtocol {
    
    let db:FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseUrl = URL(fileURLWithPath: targetPath).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: databaseUrl.path)
    }
    
    func createResponsbility(content: String) {
        db?.open()
        do{
            try db?.executeUpdate("INSERT INTO ResponsibilityDB (responsibility) VALUES (?)", values: [content])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
}
