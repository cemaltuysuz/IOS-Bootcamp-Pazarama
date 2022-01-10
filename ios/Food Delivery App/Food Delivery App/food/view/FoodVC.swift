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
    
    @IBOutlet weak var foodsTableView: UITableView!
    @IBOutlet weak var foodIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        FoodRouter.createModule(ref: self)
        
        foodsTableView.delegate = self
        foodsTableView.dataSource = self
        
        presenter?.getAllFoods()
                
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFoodDetail" {
            let targetVC = segue.destination as! FoodDetailVC
            let food = sender as! Yemekler
            targetVC.food = food
        }
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




