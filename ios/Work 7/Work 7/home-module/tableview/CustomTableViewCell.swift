//
//  CustomTableViewCell.swift
//  Work 7
//
//  Created by cemal tüysüz on 30.12.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cellContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
