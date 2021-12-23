//
//  DetailVC.swift
//  AdvancedCollectionView
//
//  Created by cemal tüysüz on 22.12.2021.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var detailMovieTitle: UILabel!
    @IBOutlet weak var detailMovieDirector: UILabel!
    @IBOutlet weak var detailMovieImageView: UIImageView!
    @IBOutlet weak var detailMoviePrice: UILabel!
    
    var movie:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let m = movie {
            detailMovieTitle.text = m.movieName!
            detailMovieDirector.text = m.movieDirectorName!
            detailMovieImageView.image = UIImage(named: m.movieImageName!)
            detailMoviePrice.text = "\(m.moviePrice!)₺"
        }

    }
    
    @IBAction func detailAddToChartButton(_ sender: Any) {
        if let m = movie {
            print("Added to chart : \(m.movieName!)")
        }
    }
}
