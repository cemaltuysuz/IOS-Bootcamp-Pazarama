//
//  HomeInteractor.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 27.12.2021.
//

import Foundation

class HomeInteractor : PresenterToInteractorHomeProtocol {
    var homePresenter: InteractorToPresenterHomeProtocol?
    
    func getAllPerson() {
        var personList = [Person]()
        let k1 = Person(kisi_id: 1, kisi_ad: "Cemal", kisi_tel: "123456")
        let k2 = Person(kisi_id: 2, kisi_ad: "Caner", kisi_tel: "654321")
        let k3 = Person(kisi_id: 3, kisi_ad: "Murat", kisi_tel: "342516")
        let k4 = Person(kisi_id: 4, kisi_ad: "Kadah", kisi_tel: "615243")
        personList.append(k1)
        personList.append(k2)
        personList.append(k3)
        personList.append(k4)
        homePresenter?.personListToPresenter(personList: personList)
    }
    
    func searchPerson(word: String) {
        print ("Search (form interactor) : \(word)")
    }
    
    func deletePerson(personId: Int) {
        print("Deleted (from interactor) \(personId).")
    }
    
    
}
