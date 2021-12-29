//
//  PersonRegisterInteractor.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

class PersonRegisterInteractor : PresenterToInteractorPersonRegisterProtocol {
    let db:FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseUrl = URL(fileURLWithPath: targetPath).appendingPathComponent("contacts.sqlite")
        db = FMDatabase(path: databaseUrl.path)
    }
    
    func insertPerson(personName: String, personNum: String) {
        db?.open()
        do{
            try db?.executeUpdate("INSERT INTO contacts (kisi_ad,kisi_tel) VALUES (?,?)", values: [personName,personNum])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
