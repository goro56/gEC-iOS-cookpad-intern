//
//  CategoriesViewCell.swift
//  Market
//
//  Created by hayato-shimoji on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit

class CategoriesCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(withCategory category: Category) {
        nameLabel.text = category.name
        thumbnailImageView.sd_setImageWithURL(category.imageURL)
    }
}
