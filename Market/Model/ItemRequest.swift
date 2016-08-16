//
//  ItemRequest.swift
//  Market
//
//  Created by hayato-shimoji on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct ItemRequest: MarketRequestType {
    typealias Response = Item
    
    var id: Int
    init(itemId: Int){
        id = itemId
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/items/\(id).json"
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeValue(object)
    }
}