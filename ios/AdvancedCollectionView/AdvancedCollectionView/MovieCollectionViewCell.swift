//
//  MovieCollectionViewCell.swift
//  AdvancedCollectionView
//
//  Created by cemal tüysüz on 22.12.2021.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImageview: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePrice: UILabel!
    
    var indexpath:IndexPath?
    var movieCellProtocol:MovieCellProtocol?
    
    @IBAction func addToChartButton(_ sender: Any) {
        movieCellProtocol?.onClick(indexpath: indexpath!)
    }
    
    
}
