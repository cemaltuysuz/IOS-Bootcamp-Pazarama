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
    
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var dataNotFoundLabel: UILabel!
    @IBOutlet weak var foodIndicator: UIActivityIndicatorView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FoodRouter.createModule(ref: self)
        
        // Food CollectionView Design
        let design = UICollectionViewFlowLayout()
        // Çevre Boşluklarının oluşturulması
        design.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        // Itemlerin yataydaki bosluklari
        design.minimumInteritemSpacing = 0
        // Dikeyde boşluklar
        design.minimumLineSpacing = 15
        
        let cellWidht = foodCollectionView.frame.width
        design.itemSize = CGSize(width: cellWidht, height: 150)
        
        foodCollectionView.collectionViewLayout = design
        
        searchBar.delegate = self
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        
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
            self.foodCollectionView.reloadData()
        }
    }
    
    func searchResults(results: [Yemekler]) {
        
    }
}


// TableView
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
       // cell.contentView.layer.borderWidth = 1
       // cell.contentView.layer.borderColor = UIColor(named: "Red100")?.cgColor
        
        /*
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 1, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.2
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        */
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toFoodDetail", sender: yemekler[indexPath.row])
    }
}




