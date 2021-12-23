//
//  ViewController.swift
//  AdvancedCollectionView
//
//  Created by cemal tüysüz on 22.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    var movieList = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate   = self
        
        let design = UICollectionViewFlowLayout()
        
        // Çevre Boşluklarının oluşturulması
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        // Itemlerin yataydaki bosluklari
        design.minimumInteritemSpacing = 10
        // Dikeyde boşluklar
        design.minimumLineSpacing = 10
        
        let widht = moviesCollectionView.frame.width
        let cellWidht = (widht-30)/2
        design.itemSize = CGSize(width: cellWidht, height: cellWidht*1.80)
        
        moviesCollectionView.collectionViewLayout = design
       
        let m1 = Movie(movieId: 1, movieName: "Django", movieImageName: "django", movieDirectorName: "Quentin Tarantino", moviePrice: 15.99)
        let m2 = Movie(movieId: 2, movieName: "Inception", movieImageName: "inception", movieDirectorName: "Christopher Nolan", moviePrice: 13.99)
        let m3 = Movie(movieId: 3, movieName: "Interstellar", movieImageName: "interstellar", movieDirectorName: "Christopher Nolan", moviePrice: 18.99)
        let m4 = Movie(movieId: 4, movieName: "Anadoluda", movieImageName: "anadoluda", movieDirectorName: "Nuri Bilge Ceylan", moviePrice: 15.99)
        let m5 = Movie(movieId: 5, movieName: "The Hateful Eight", movieImageName: "thehatefuleight", movieDirectorName: "Quentin Tarantino", moviePrice: 15.99)
        let m6 = Movie(movieId: 5, movieName: "The Pianist", movieImageName: "thepianist", movieDirectorName: "Roman Polanski", moviePrice: 15.99)
        
        movieList.append(m1)
        movieList.append(m2)
        movieList.append(m3)
        movieList.append(m4)
        movieList.append(m5)
        movieList.append(m6)
                
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let incomingMovie = sender as! Movie
            let targetVC = segue.destination as! DetailVC
            targetVC.movie = incomingMovie
        }
    }
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource, MovieCellProtocol {
    func onClick(indexpath: IndexPath) {
        let movie = movieList[indexpath.row]
        print("Added to chart : \(movie.movieName!)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentMovie = movieList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.systemIndigo.cgColor
        cell.layer.borderWidth = 1
        
        cell.indexpath = indexPath
        cell.movieCellProtocol = self
        
        
        cell.movieImageview.image = UIImage(named: currentMovie.movieImageName!)
        cell.movieTitle.text = currentMovie.movieName
        cell.moviePrice.text = "\(currentMovie.moviePrice!)₺"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movieList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: movie)
    }
}

