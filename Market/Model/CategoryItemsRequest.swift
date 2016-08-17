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

struct CategoryItemsRequest: MarketRequestType {
    typealias Response = [Item]
    
    var id: Int
    init(categoryId: Int){
        id = categoryId
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/categories/\(id)/items.json"
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeArray(object)
    }
}