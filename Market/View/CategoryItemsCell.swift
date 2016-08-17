//
//  CategoryItemCell.swift
//  Market
//
//  Created by hayato-shimoji on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit

class CategoryItemsCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func update(withItem item: Item) {
        nameLabel.text = item.name
        thumbnailImageView.sd_setImageWithURL(item.imageURL)
    }
}
