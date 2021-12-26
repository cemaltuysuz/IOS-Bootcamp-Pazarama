//
//  ViewController.swift
//  Work 6
//
//  Created by cemal tüysüz on 26.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var productList = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productList.append(Product(productId: 1, productImage: "iphone_13", productTitle: "Iphone 13", productDescription: "Yeni nesil akıllı telefon", productPrice: 10120.0, isShippingFree: true, isFastDelivery: true))
        productList.append(Product(productId: 2, productImage: "huaweii_P40", productTitle: "Huaweii P40", productDescription: "Yeni nesil akıllı telefon", productPrice: 9570.0, isShippingFree: true, isFastDelivery: false))
        productList.append(Product(productId: 3, productImage: "samsung_A02", productTitle: "Samsung A02", productDescription: "Yeni nesil akıllı telefon", productPrice: 3230.0, isShippingFree: true, isFastDelivery: false))
        productList.append(Product(productId: 4, productImage: "iphone_12", productTitle: "Iphone 12", productDescription: "Yeni nesil akıllı telefon", productPrice: 8410.0, isShippingFree: true, isFastDelivery: true))
        productList.append(Product(productId: 5, productImage: "iphone_x", productTitle: "Iphone X", productDescription: "Yeni nesil akıllı telefon", productPrice: 7200.0, isShippingFree: true, isFastDelivery: true))
        productList.append(Product(productId: 6, productImage: "samsung_A52", productTitle: "Samsung A52", productDescription: "Yeni nesil akıllı telefon", productPrice: 4469.0, isShippingFree: true, isFastDelivery: false))
        productList.append(Product(productId: 7, productImage: "samsung_s8", productTitle: "Samsung S8", productDescription: "Yeni nesil akıllı telefon", productPrice: 5150.0, isShippingFree: true, isFastDelivery: true))
        
        // Collection View için space / design ayarları
        let design = UICollectionViewFlowLayout()
        // inset (CollectionView)
        design.sectionInset = UIEdgeInsets(top: 10, left: 25, bottom: 0, right: 25)
        // Horizontal space between Items (Item)
        design.minimumInteritemSpacing = 10
        // Vertical space between Items (Item)
        design.minimumLineSpacing = 10
                
        // Total horizontal space = Left Space(10) + Right Space(10) + 3 Count Item (5 + 5) -> 30
        let width = self.productCollectionView.frame.width
                
        design.itemSize = CGSize(width: (width-40)/3, height: 240)
        productCollectionView!.collectionViewLayout = design
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
    }


}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let current = productList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customProductCell", for: indexPath) as! ProductCollectionViewCell
        
        cell.productImage.image = UIImage(named: current.productImage!)
        cell.productTitle.text = current.productTitle!
        cell.productPrice.text = "\(current.productPrice!)₺"
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        if current.isFastDelivery {
            cell.fastDelivery.isHidden = false
        }else {
            cell.fastDelivery.isHidden = true
        }
        
        return cell
    }
    
    
}

