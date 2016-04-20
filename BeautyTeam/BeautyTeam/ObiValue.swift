//
//  ObiValue.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/20/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class ObiValue<T>: ServerReply {
    var value: T!
    
    required init(rawData: [String : AnyObject?]) {
        super.init(rawData: rawData)
        guard let value = rawData["Value"] as? T else {
            fatalError()
        }
        self.value = value
    }
}
