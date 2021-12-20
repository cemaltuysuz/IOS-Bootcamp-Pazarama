//
//  ProductTableViewCell.swift
//  AdvancedTableView
//
//  Created by cemal tüysüz on 19.12.2021.
//

import UIKit

protocol CellProtocol{
    func buttonOnClick(indexPath:IndexPath)
}

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var itemView: UIView!
    
    var cellProtocol:CellProtocol?
    var indexPath:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func InsertToChart(_ sender: Any) {
        cellProtocol?.buttonOnClick(indexPath: indexPath!)
    }
}
