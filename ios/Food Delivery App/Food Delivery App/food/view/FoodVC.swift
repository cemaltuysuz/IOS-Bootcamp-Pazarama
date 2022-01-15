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
    var presenter: ViewToPresenterFood? // Presenter
    
    private var pendingRequestWorkItem: DispatchWorkItem?
    
    // Views
    @IBOutlet weak var foodCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var dataNotFoundLabel: UILabel!
    @IBOutlet weak var foodIndicator: UIActivityIndicatorView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FoodRouter.createModule(ref: self)
        
        // UICollectionView Design
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 0,
                                           left: 0,
                                           bottom: 0,
                                           right: 0)
        design.minimumInteritemSpacing = 0
        design.minimumLineSpacing = 15
        let cellWidht = foodCollectionView.frame.width
        design.itemSize = CGSize(width: cellWidht, height: 150)
        foodCollectionView.collectionViewLayout = design
        
        // Delegate
        searchBar.delegate = self
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        databaseCopy()
        presenter?.getAllFoods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getAllFoods()
    }
    
    
    /*
     With this function, I copy the previously created sqlite database to local storage.
     */
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
            }catch{
                print(error.localizedDescription)
            }
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
        // Cancel previous work when user input data.
        pendingRequestWorkItem?.cancel()
        
        let requestWorkItem = DispatchWorkItem { [weak self] in
                self?.presenter?.searchFood(searchText: searchText)
        }
        // I created a work with 250 millisecond delay.
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
            self.foodCollectionView.reloadData()
        }
    }
}


// CollectionView
extension FoodVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yemekler.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentFood = yemekler[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCollectionViewCell", for: indexPath) as! FoodCollectionViewCell
        
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(currentFood.yemek_resim_adi!)")!
        
        cell.foodImage.kf.setImage(with: url)
        cell.foodName.text = currentFood.yemek_adi!
        cell.foodPrice.text = "\(currentFood.yemek_fiyat!)₺"
        
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.masksToBounds = true

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toFoodDetail", sender: yemekler[indexPath.row])
    }
}




