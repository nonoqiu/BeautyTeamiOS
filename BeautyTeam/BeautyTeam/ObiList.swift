//
//  ObiList.swift
//  BeautyTeam
//
//  Created by Carl Lee on 5/6/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation

class ObiList<T: InitialProtocol>: ServerReply {
    var list: [T] = [T]()
    
    required init(rawData: [String : AnyObject?]) {
        super.init(rawData: rawData)
        
        guard let list = rawData["List"] as? [[String : AnyObject]] else {
            fatalError()
        }
        for element in list {
            self.list.append(T(rawData: element))
        }
    }
}
