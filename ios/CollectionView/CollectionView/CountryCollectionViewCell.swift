//
//  CountryCollectionViewCell.swift
//  CollectionView
//
//  Created by cemal tüysüz on 20.12.2021.
//

import UIKit

protocol CollectionCellProtocol{
    func onClick(indexpath:IndexPath)
}

class CountryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var countryLabel: UILabel!
    
    var indexPath:IndexPath?
    var collectionCellProtocol:CollectionCellProtocol?
    
    @IBAction func selectButton(_ sender: Any) {
        collectionCellProtocol?.onClick(indexpath: indexPath!)
    }
}
