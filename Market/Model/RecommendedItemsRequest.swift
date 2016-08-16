//
//  RecommendedItemRequest.swift
//  Market
//
//  Created by hayato-shimoji on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct RecommendedItemsRequest: MarketRequestType {
    typealias Response = [Item]
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/items/recommended.json"
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeArray(object)
    }
}