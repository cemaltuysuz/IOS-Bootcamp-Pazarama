//
//  HomeVC.swift
//  Contacts Apps
//
//  Created by cemal tüysüz on 18.12.2021.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var personInfo: UILabel!
    
    var personList = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let k1 = Person(kisi_id: 1, kisi_ad: "Cemal", kisi_tel: "123456")
        let k2 = Person(kisi_id: 2, kisi_ad: "Caner", kisi_tel: "654321")
        let k3 = Person(kisi_id: 3, kisi_ad: "Murat", kisi_tel: "342516")
        let k4 = Person(kisi_id: 4, kisi_ad: "Kadah", kisi_tel: "615243")
        personList.append(k1)
        personList.append(k2)
        personList.append(k3)
        personList.append(k4)
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        searchBar.delegate = self

    }
    /*
    @IBAction func denemeButton(_ sender: Any) {
        let kisi = Person(kisi_id: 1, kisi_ad: "cEMAL", kisi_tel: "123456")
        performSegue(withIdentifier: "toDetay", sender: kisi)
    } */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let kisi = sender as? Person
            let targetVC = segue.destination as! PersonDetailsVC
            targetVC.kisi = kisi
        }
    }
}

extension HomeVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama sonucu : \(searchText)")
    }
}

extension HomeVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = personList[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "personCell",for: indexPath) as! TableViewCell
        
        hucre.label.text = "\(kisi.kisi_id!) | \(kisi.kisi_ad!) | \(kisi.kisi_tel!)"
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = personList[indexPath.row]
        print("\(kisi.kisi_ad!) - \(kisi.kisi_tel!)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
