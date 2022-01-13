//
//  MealsVC.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import UIKit
import Kingfisher

class FoodVC: UIViewController {

    var yemekler = [Yemekler]()
    var presenter: ViewToPresenterFood?
    private var pendingRequestWorkItem: DispatchWorkItem?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var dataNotFoundLabel: UILabel!
    @IBOutlet weak var foodsTableView: UITableView!
    @IBOutlet weak var foodIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        FoodRouter.createModule(ref: self)
        
        searchBar.delegate = self
        foodsTableView.delegate = self
        foodsTableView.dataSource = self
        
        databaseCopy()
        presenter?.getAllFoods()         
    }
    
    
    func databaseCopy(){
        let bundlePath = Bundle.main.path(forResource: "FoodDB", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("FoodDB.sqlite")
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: copyPath.path){
            print("Database is exists")
        }else {
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyPath.path)
            }catch{}
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFoodDetail" {
            let targetVC = segue.destination as! FoodDetailVC
            let food = sender as! Yemekler
            targetVC.food = food
        }
    }
}

extension FoodVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        pendingRequestWorkItem?.cancel()
        
        let requestWorkItem = DispatchWorkItem { [weak self] in
                self?.presenter?.searchFood(searchText: searchText)
        }
        pendingRequestWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(250),
                                              execute: requestWorkItem)
        
        
    }
}

// Protocols
extension FoodVC : PresenterToViewFood {
    func indicatorVisibility(bool: Bool) {
        DispatchQueue.main.async {
            if bool {
                self.foodIndicator.startAnimating()
            }else {
                self.foodIndicator.stopAnimating()
            }
        }
    }
    
    func foodsToView(yemekler: [Yemekler]) {
        DispatchQueue.main.async {
            self.yemekler = yemekler
            self.foodsTableView.reloadData()
        }
    }
    
    func searchResults(results: [Yemekler]) {
        
    }
}


// TableView
extension FoodVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemekler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentFood = yemekler[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainMeals", for: indexPath) as! FoodTableViewCell
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(currentFood.yemek_resim_adi!)")!
        
        cell.foodName.text = currentFood.yemek_adi!
        cell.foodPrice.text = "\(currentFood.yemek_fiyat!)₺"
        cell.foodImage.kf.setImage(with: url)
                            
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toFoodDetail", sender: yemekler[indexPath.row])
    }

}




