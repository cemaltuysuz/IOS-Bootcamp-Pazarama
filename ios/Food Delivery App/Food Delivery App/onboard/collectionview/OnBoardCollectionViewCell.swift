//
//  OnBoardCollectionViewCell.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 15.01.2022.
//

import UIKit

class OnBoardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animationContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(page:Page) {
        
    }
}
