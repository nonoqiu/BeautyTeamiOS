//
//  ServerReply.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/15/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation

class ServerReply: InitialProtocol {
    var statusCode: Int!
    
    required init(rawData: [String : AnyObject?]) {
        guard let statusCode = rawData["StatusCode"] as? Int else {
            fatalError()
        }
        if statusCode == 500 {
            fatalError("500 API")
        }
        self.statusCode = statusCode
    }
}
