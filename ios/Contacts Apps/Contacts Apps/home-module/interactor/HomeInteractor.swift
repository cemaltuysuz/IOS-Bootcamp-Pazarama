//
//  HomeInteractor.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

class HomeInteractor : PresenterToInteractorHomeProtocol {
    var homePresenter: InteractorToPresenterHomeProtocol?
    
    let db:FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseUrl = URL(fileURLWithPath: targetPath).appendingPathComponent("contacts.sqlite")
        db = FMDatabase(path: databaseUrl.path)
    }
    
    func getAllPerson() {
        var personList = [Person]()
        
        db?.open()
        
        do{
            let c = try db!.executeQuery("SELECT * FROM contacts", values: nil)
            
            while c.next() {
                let person = Person(
                    kisi_id: Int(c.string(forColumn: "kisi_id"))!,
                    kisi_ad: c.string(forColumn: "kisi_ad")!,
                    kisi_tel: c.string(forColumn: "kisi_tel")!
                )
                personList.append(person)
            }
            homePresenter?.personListToPresenter(personList: personList)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func searchPerson(word: String) {
        var personList = [Person]()
        
        db?.open()
        
        do{
            let c = try db!.executeQuery("SELECT * FROM contacts WHERE contacts.kisi_ad  like '%\(word)%'", values: nil)
            
            while c.next() {
                let person = Person(
                    kisi_id: Int(c.string(forColumn: "kisi_id"))!,
                    kisi_ad: c.string(forColumn: "kisi_ad")!,
                    kisi_tel: c.string(forColumn: "kisi_tel")!
                )
                personList.append(person)
            }
            homePresenter?.personListToPresenter(personList: personList)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func deletePerson(personId: Int) {
        db?.open()
        do{
            try db?.executeUpdate("DELETE FROM contacts WHERE kisi_id = ?", values: [personId])
            getAllPerson()
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
