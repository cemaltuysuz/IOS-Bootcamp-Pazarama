//
//  ViewController.swift
//  CollectionView
//
//  Created by cemal tüysüz on 20.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countrieCollectionView: UICollectionView!
    
    var countriesList = [Country]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countrieCollectionView.delegate = self
        countrieCollectionView.dataSource = self
        
        let c1 = Country(countryId: 1, countryName: "Turkey", countryCapital: "Ankara")
        let c2 = Country(countryId: 2, countryName: "France", countryCapital: "Paris")
        let c3 = Country(countryId: 3, countryName: "Italia", countryCapital: "Roma")
        let c4 = Country(countryId: 4, countryName: "England", countryCapital: "London")
        let c5 = Country(countryId: 5, countryName: "Japan", countryCapital: "Tokyo")
        
        countriesList.append(c1)
        countriesList.append(c2)
        countriesList.append(c3)
        countriesList.append(c4)
        countriesList.append(c5)
        
        let design = UICollectionViewFlowLayout()
        // inset (CollectionView)
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        // Horizontal space between Items (Item)
        design.minimumInteritemSpacing = 5
        // Vertical space between Items (Item)
        design.minimumLineSpacing = 5
        
        // Total horizontal space = Left Space(10) + Right Space(10) + 3 Count Item (5 + 5) -> 30
        let width = self.countrieCollectionView.frame.width
        
        design.itemSize = CGSize(width: (width-30)/3, height: (width-30)/3)
        countrieCollectionView!.collectionViewLayout = design
        
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countriesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let country = countriesList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as! CountryCollectionViewCell
        
        cell.countryLabel.text = country.countryName!
        return cell
        
    }
    
    
}

