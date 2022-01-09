//
//  MealsVC.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import UIKit

class FoodVC: UIViewController {

    var yemekler = [Yemekler]()
    var presenter: ViewToPresenterFood?
    @IBOutlet weak var foodsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodsTableView.isHidden = true
        
        FoodRouter.createModule(ref: self)
        
        foodsTableView.delegate = self
        foodsTableView.dataSource = self
        
        presenter?.getAllFoods()
                
    }
}
// Protocols
extension FoodVC : PresenterToViewFood {
    func foodsToView(yemekler: [Yemekler]) {
        DispatchQueue.main.async {
            self.yemekler = yemekler
            self.foodsTableView.reloadData()
        }
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
        
        cell.selectionStyle = .none
        cell.layer.borderColor = UIColor(named: "Grey200")?.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        
        cell.foodName.text = currentFood.yemek_adi!
        cell.foodPrice.text = "\(currentFood.yemek_fiyat!)₺"
        
        return cell
    }
    
    
}




