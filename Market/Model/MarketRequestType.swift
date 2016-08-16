//
//  MarketRequestType.swift
//  Market
//
//  Created by hayato-shimoji on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import Foundation
import APIKit

protocol MarketRequestType: RequestType {}

extension MarketRequestType {
    var baseURL: NSURL {
        return NSURL(string: "http://localhost:3000")!
    }
}