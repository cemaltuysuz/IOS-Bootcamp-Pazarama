//
//  PersonDetailInteractor.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

class PersonDetailInteractor : PresenterToInteractorPersonDetailProtocol {
    
    let db:FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseUrl = URL(fileURLWithPath: targetPath).appendingPathComponent("contacts.sqlite")
        db = FMDatabase(path: databaseUrl.path)
    }
    
    func updatePerson(personId: Int, personName: String, personNum: String) {
        db?.open()
        do{
            try db!.executeUpdate("UPDATE contacts SET kisi_ad = ? , kisi_tel = ? WHERE kisi_id = ?", values: [personName,personNum,personId])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
