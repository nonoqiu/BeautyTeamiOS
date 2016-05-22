//
//  ObisoftAnotherUser.swift
//  BeautyTeam
//
//  Created by Carl Lee on 5/22/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class ObisoftAnotherUser: InitialProtocol {
    
    var nickname: String
    var realName: String
    var iconImageURL: NSURL
    var description: String
//    var personalPostss: String!
    
    required init(rawData: [String : AnyObject?]) {
        guard let nickname = rawData["NickName"] as? String else {
            fatalError()
        }
        guard let realName = rawData["RealName"] as? String else {
            fatalError()
        }
        guard let iconImageURL_raw = rawData["IconImage"] as? String else {
            fatalError()
        }
        guard let description = rawData["Description"] as? String else {
            fatalError()
        }
        guard let iconImageURL = NSURL(string: iconImageURL_raw) else {
            fatalError()
        }
        
        self.nickname = nickname
        self.realName = realName
        self.iconImageURL = iconImageURL
        self.description = description
    }
    
}
