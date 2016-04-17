//
//  Group.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/16/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class Group: InitialProtocol {
    var groupId: Int?
    var groupName: String?
    var groupDescription: String?
    var groupImageURL: NSURL?
    
    var groupUserRelation: [GroupUserRelation] = [GroupUserRelation]()
    
    required init(rawData: [String : AnyObject?]) {
        guard let groupId = rawData["GroupId"] as? Int else {
            fatalError()
        }
        guard let groupName = rawData["GroupName"] as? String else {
            fatalError()
        }
        guard let groupDescription = rawData["GroupDescription"] as? String else {
            fatalError()
        }
        guard let groupImageURL_raw = rawData["GroupImageURL"] as? String else {
            fatalError()
        }
        guard let groupImageURL = NSURL(string: groupImageURL_raw) else {
            fatalError()
        }
        guard let groupUserRelation_raw = rawData["GU_Relation"] as? [[String : AnyObject?]] else {
            fatalError()
        }
        
        self.groupId = groupId
        self.groupName = groupName
        self.groupDescription = groupDescription
        self.groupImageURL = groupImageURL
        for element in groupUserRelation_raw {
            self.groupUserRelation.append(GroupUserRelation(rawData: element))
        }
    }
}
