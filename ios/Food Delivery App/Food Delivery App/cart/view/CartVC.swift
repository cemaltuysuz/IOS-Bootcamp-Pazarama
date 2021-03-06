//
//  CartVC.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 11.01.2022.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var cartCollectionView: UICollectionView!
    
    @IBOutlet weak var pageTotalLabel: UILabel!
    var cartList:[Cart]?
    var presenter:ViewToPresenterCartProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartList = [Cart]()
        
        CartRouter.createModule(ref: self)
        
        cartCollectionView.delegate = self
        cartCollectionView.dataSource = self
        cartCollectionView.showsVerticalScrollIndicator = false
        cartCollectionView.showsHorizontalScrollIndicator = false
        
        let design = UICollectionViewFlowLayout()
               
        // Çevre Boşluklarının oluşturulması
        design.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        // Itemlerin yataydaki bosluklari
        design.minimumInteritemSpacing = 10
        // Dikeyde boşluklar
        design.minimumLineSpacing = 25
        
        design.itemSize = CGSize(width: 160, height: 250)
               
        cartCollectionView.collectionViewLayout = design
        
        presenter?.getTheCart()
        
    }
    
    @IBAction func deleteCart(_ sender: Any) {
        let alert = UIAlertController(title: "Silme işlemi", message: "Sepetinizi temizlemek istediğinize emin misiniz ?", preferredStyle: .alert)
                  
                   let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ _ in
                   }
                   
                   let evetAction = UIAlertAction(title: "Evet", style: .destructive){ _ in
                       self.presenter?.deleteCart()
                   }
                   alert.addAction(iptalAction)
                   alert.addAction(evetAction)
                   self.present(alert,animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getTheCart()
        
        DispatchQueue.main.async {
            DAO.shared.getFoods(completionHandler: { response in
                print(response.count)
                
            })
        }
    }
}

// Presenter to View
extension CartVC : PresenterToViewCartProtocol {
    func cartToView(items: [Cart]) {
        DispatchQueue.main.async {
            var totalPrice = 0
            self.cartList = items
            self.cartCollectionView.reloadData()
            for index in items {
                totalPrice = totalPrice + (Int(index.yemek_fiyat!)! * Int(index.yemek_siparis_adet!)!)
            }
            self.pageTotalLabel.text = "\(totalPrice)₺"
        }
    }
    
}

// CollectionView
extension CartVC :  UICollectionViewDelegate, UICollectionViewDataSource, CartCollectionViewProtocol {
    func increaseAmount(indexPath: IndexPath) {
        presenter?.increaseAmount(cartId: Int(cartList![indexPath.row].sepet_yemek_id!)!)
    }
    
    func reduceAmount(indexPath: IndexPath) {
        presenter?.reduceAmount(cartId: Int(cartList![indexPath.row].sepet_yemek_id!)!)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartList!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let currentCart = cartList?[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cartCollectionViewCell", for: indexPath) as! CartCollectionViewCell
        
        cell.cartCollectionViewProtocol = self
        cell.indexPath = indexPath
        
        cell.layer.masksToBounds = true
        //cell.layer.borderColor = UIColor(named: "Grey200")?.cgColor
        //cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        
       // cell.contentView.layer.borderWidth = 1
       // cell.contentView.layer.borderColor = UIColor(named: "Red100")?.cgColor
        
        
        
        
        if let cart = currentCart {
            cell.foodNameFromCart.text = cart.yemek_adi
            cell.foodAmountCart.text = "x\(cart.yemek_siparis_adet!)"
            cell.totalPriceFood.text = "\(Int(cart.yemek_fiyat!)! * Int(cart.yemek_siparis_adet!)!)₺"
            let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(cart.yemek_resim_adi!)")!
            cell.foodImageFromCart.kf.setImage(with: url)
        }
        
        return cell
    }
    
    func deleteFood(indexPath: IndexPath) {
        let selectedFoodName = self.cartList![indexPath.row].yemek_adi!
        let alert = UIAlertController(title: "Silme işlemi", message: "Sepetinizden \(selectedFoodName) adlı ürünü kaldırmak istediğinize emin misiniz ?", preferredStyle: .alert)
                  
                   let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ _ in
                   }
                   
                   let evetAction = UIAlertAction(title: "Evet", style: .destructive){ _ in
                       self.presenter?.deleteFoodFromCart(foodName: selectedFoodName)
                   }
                   alert.addAction(iptalAction)
                   alert.addAction(evetAction)
                   self.present(alert,animated: true)
        
    }
}
