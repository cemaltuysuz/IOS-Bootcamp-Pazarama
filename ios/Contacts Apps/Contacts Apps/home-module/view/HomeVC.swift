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
    
    var homePresenter : ViewToPresenterHomeProtocol?
    
    var personList = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeRouter.createModule(ref: self)
        homePresenter?.getPeople()
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        searchBar.delegate = self

    }
    
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
        self.homePresenter?.searchThePerson(word: searchText)
    }
}

extension HomeVC : PresenterToViewHomeProtocol {
    func personListToView(personList: Array<Person>) {
        self.personList = personList
        contactsTableView?.reloadData()
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
        tableView.deselectRow(at: indexPath, animated: true)
        let kisi = personList[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil"){(contextualAction,view,bool) in
            let kisi = self.personList[indexPath.row]
            let alert = UIAlertController(title: "Silme işlemi", message: "\(kisi.kisi_ad!) silinsin mi ?", preferredStyle: .alert)
           
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ _ in
            }
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ _ in
                self.homePresenter?.deleteThePerson(personId: kisi.kisi_id!)
            }
            alert.addAction(iptalAction)
            alert.addAction(evetAction)
            self.present(alert,animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}
