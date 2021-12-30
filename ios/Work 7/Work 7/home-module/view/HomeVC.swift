//
//  HomeVC.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var homeSearchBar: UISearchBar!
    @IBOutlet weak var homeTableView: UITableView!
    
    var tempList = [Responsibility]()
    
    var presenter:ViewToPresenterHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeSearchBar.delegate = self
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        
        HomeRouter.createModule(ref: self)
        
        presenter?.getAllResponsibilities()
    }
}
// For VIPER
extension HomeVC : PresenterToViewHomeProtocol {
    func listToView(list: Array<Responsibility>) {
        self.tempList = list
        self.homeTableView.reloadData()
    }
}

// For tableView
extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentResp = tempList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.cellContent.text = currentResp.responsibility!
        return cell
    }
}

// For SearchBar
extension HomeVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchTheResponsibility(word: searchText)
    }
}


