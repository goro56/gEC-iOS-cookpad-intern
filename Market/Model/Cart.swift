//
//  Cart.swift
//  Market
//
//  Created by hayato-shimoji on 2016/08/18.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import Foundation

final class Cart {
    static let instance = Cart()
    
    private init() {}
    
    var quantities : [Int: Int] = [:]
    
    func add (itemId : Int, quantity : Int) {
        if quantities[itemId] != nil {
            quantities[itemId]! += quantity
        } else {
            quantities[itemId] = quantity
        }
    }
    
    func getQuantity(itemId: Int) -> Int {
        return quantities[itemId]!
    }
    
    func getItemIds() -> [Int] {
        var result : [Int] = []
        for quantity in quantities {
            result += [quantity.0]
        }
        return result
    }
}