//
//  Movie.swift
//  AdvancedCollectionView
//
//  Created by cemal tüysüz on 22.12.2021.
//

import Foundation

class Movie {
    var movieId:Int?
    var movieName:String?
    var movieImageName:String?
    var movieDirectorName:String?
    var moviePrice:Double?
    
    init(){
    }
    
    init(movieId:Int,movieName:String,movieImageName:String,movieDirectorName:String,moviePrice:Double){
        self.movieId = movieId
        self.movieName = movieName
        self.movieImageName = movieImageName
        self.movieDirectorName = movieDirectorName
        self.moviePrice = moviePrice
    }
}
