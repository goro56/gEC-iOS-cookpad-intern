//
//  CartCell.swift
//  Market
//
//  Created by hayato-shimoji on 2016/08/18.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    func update(withItem item: Item, withQuantity quantity: Int) {
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)円"
        quantityLabel.text = "数量: \(quantity)"
        thumbnailImageView.sd_setImageWithURL(item.imageURL)
    }

}
