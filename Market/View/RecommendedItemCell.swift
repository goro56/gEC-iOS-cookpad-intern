//
//  RecommendedItemCell.swift
//  Market
//
//  Created by hayato-shimoji on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import WebImage

class RecommendedItemCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func update(withItem item: Item) {
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)円"
        descriptionLabel.text = item.desc
        thumbnailImageView.sd_setImageWithURL(item.imageURL)
    }
}
