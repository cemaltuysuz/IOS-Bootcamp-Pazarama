//
//  OnBoardCollectionViewCell.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 15.01.2022.
//

import UIKit
import Lottie

class OnBoardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animationContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var animation = AnimationView()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
