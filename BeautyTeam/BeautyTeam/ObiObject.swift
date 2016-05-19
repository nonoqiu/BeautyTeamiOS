//
//  ObiObject.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/20/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class ObiObject<T: InitialProtocol>: ServerReply {
    var object: T!
    
    required init(rawData: [String : AnyObject?]) {
        super.init(rawData: rawData)
        print(rawData)
        guard let object_raw = rawData["Object"] as? [String : AnyObject] else {
//            print(rawData["Object"]);
            fatalError()
        }
        self.object = T(rawData: object_raw)
    }
}
