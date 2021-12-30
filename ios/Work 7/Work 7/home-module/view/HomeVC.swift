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
        
        copyDatabase()
        
        homeSearchBar.delegate = self
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        HomeRouter.createModule(ref: self)
        
        presenter?.getAllResponsibilities()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let targetVC = segue.destination as! DetailVC
            let responsibility = sender as! Responsibility
            targetVC.resp = responsibility
        }
    }
    func copyDatabase(){
        let bundlePath = Bundle.main.path(forResource: "todo", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("todo.sqlite")
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: copyPath.path){
            print("Database is exists")
        }else {
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyPath.path)
            }catch{
                print(error.localizedDescription)
            }
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectResp = tempList[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: selectResp)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){(contextualAction,view,bool) in
            let resp = self.tempList[indexPath.row]
            let alert = UIAlertController(title: "Delete Action", message: "Are you sure ?", preferredStyle: .alert)
           
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ _ in
                print("Cancelled.")
            }
            
            let confirmAction = UIAlertAction(title: "Yes", style: .destructive){ _ in
                self.presenter?.deleteTheResponsibility(responsibilityId: resp.responsibilityId!)
            }
            alert.addAction(cancelAction)
            alert.addAction(confirmAction)
            self.present(alert,animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

// For SearchBar
extension HomeVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchTheResponsibility(word: searchText)
    }
}


