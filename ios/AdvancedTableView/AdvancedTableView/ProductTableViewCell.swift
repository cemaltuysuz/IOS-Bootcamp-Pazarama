//
//  ProductTableViewCell.swift
//  AdvancedTableView
//
//  Created by cemal tüysüz on 19.12.2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var itemView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
