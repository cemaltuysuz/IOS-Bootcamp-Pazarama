//
//  CartVC.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 11.01.2022.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var cartCollectionView: UICollectionView!
    
    var cartList:[Cart]?
    var presenter:ViewToPresenterCartProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    
}
extension CartVC : PresenterToViewCartProtocol {
    func cartToView(items: [Cart]) {
        DispatchQueue.main.async {
            self.cartList = items
            self.cartCollectionView.reloadData()
        }
    }
}


extension CartVC :  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartList?.count ?? 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cartCollectionViewCell", for: indexPath) as! CartCollectionViewCell
        
        cell.layer.masksToBounds = true
        cell.layer.borderColor = UIColor(named: "Grey200")?.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        
        return cell
    }
    
    
}
