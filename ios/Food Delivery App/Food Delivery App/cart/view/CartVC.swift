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
        design.minimumLineSpacing = 10
        
        design.itemSize = CGSize(width: 160, height: 250)
               
        cartCollectionView.collectionViewLayout = design
        
        presenter?.getTheCart()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getTheCart()
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
extension CartVC :  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartList!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let currentCart = cartList?[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cartCollectionViewCell", for: indexPath) as! CartCollectionViewCell
        
        cell.layer.masksToBounds = true
        cell.layer.borderColor = UIColor(named: "Grey200")?.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        
        if let cart = currentCart {
            cell.foodNameFromCart.text = cart.yemek_adi
            cell.foodAmountCart.text = "x\(cart.yemek_siparis_adet!)"
            cell.totalPriceFood.text = "\(Int(cart.yemek_fiyat!)! * Int(cart.yemek_siparis_adet!)!)₺"
            let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(cart.yemek_resim_adi!)")!
            cell.foodImageFromCart.kf.setImage(with: url)
        }
        
        return cell
    }
    
    
}
