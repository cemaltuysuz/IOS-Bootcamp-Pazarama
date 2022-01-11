//
//  FoodDetailVC.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 9.01.2022.
//

import UIKit

class FoodDetailVC: UIViewController {
    
    @IBOutlet weak var foodScore: UILabel!
    @IBOutlet weak var foodNameDetail: UILabel!
    @IBOutlet weak var foodImageDetail: UIImageView!
    @IBOutlet weak var foodAmount: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var addToFavorites: UIBarButtonItem!
    
    var alert:MyAlert?
    
    var presenter:ViewToPresenterFoodDetail?
    
    var food:Yemekler?

    override func viewDidLoad() {
        super.viewDidLoad()
                
        FoodDetailRouter.createModule(ref: self)
        
        let iPart = Int.random(in: 0...5)
        let dPart = Int.random(in: 0...9)
        
        foodScore.text = "\(iPart).\(dPart)"
        
        if let yemek = food {
            foodNameDetail.text = yemek.yemek_adi!
            foodPrice.text = "\(yemek.yemek_fiyat!)₺"
            let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")!
            foodImageDetail.kf.setImage(with: url)
        }

    }
    @IBAction func reduceTheAmountButton(_ sender: Any) {
        if foodAmount.text != "1" {
            if let price = food?.yemek_fiyat, let amount = foodAmount.text  {
                if let priceInt = Int(price), let amountInt = Int(amount) {
                    let count = amountInt-1
                    foodAmount.text = "\(count)"
                    foodPrice.text = "\(count * priceInt)₺"
                }
            }
        }
    }
    
    @IBAction func increaseTheAmountButton(_ sender: Any) {
        if let price = food?.yemek_fiyat, let amount = foodAmount.text {
            if let priceInt = Int(price), let amountInt = Int(amount) {
                let count = amountInt+1
                foodAmount.text = "\(count)"
                foodPrice.text = "\(count * priceInt)₺"
            }
        }
    }
    /**
     Kullanıcı sepete ekle kısmında interactor sınıfıda yemeği bir nesne olarak iletirken miktarı Int tipinde gönderiyorum.
     Ücret hesaplaması gibi işlemleri interactor sınıfında halledeceğim.
     */
    
    @IBAction func addToCartButton(_ sender: Any) {
        if let mFood = food, let amount = foodAmount.text {
            if let amountInt = Int(amount) {
                presenter?.addToCart(food: mFood, amount: amountInt)
            }
        }
    }
    
    @IBAction func addToFavoritesButton(_ sender: Any) {
    }
    
    @objc func dismissAlert(){
        alert?.dismissAlert()
    }
    
}

extension FoodDetailVC : PresenterToViewFoodDetail {
    func addToCartStatus(bool: Bool) {
        if bool {
            alert = MyAlert()
            alert!.showAlert(with: "Sepete ekleme durumu",
                            message: "Başarılı",
                            viewController: self)
        }else {
            alert = MyAlert()
            alert!.showAlert(with: "Sepete ekleme durumu",
                            message: "Başarısız",
                            viewController: self)
        }
    }
}
