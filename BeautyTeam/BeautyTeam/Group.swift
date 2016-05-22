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
    
//    var groupUserRelation: [GroupUserRelation] = [GroupUserRelation]()
    
    required init(rawData: [String : AnyObject?]) {
        guard let groupId = rawData["GroupId"] as? Int else {
            print(rawData["GroupId"]);
            fatalError()
        }
        guard let groupName = rawData["GroupName"] as? String else {
            fatalError()
        }
        guard let groupDescription = rawData["GroupDescription"] as? String else {
            fatalError()
        }
//        guard let groupUserRelation_raw = rawData["GU_Relations"] as? [[String : AnyObject]] else {
//            fatalError()
//        }
        
        self.groupId = groupId
        self.groupName = groupName
        self.groupDescription = groupDescription
//        for element in groupUserRelation_raw {
//            self.groupUserRelation.append(GroupUserRelation(rawData: element))
//        }
        
        
        if let groupImageURL_raw = rawData["GroupImage"] as? String {
            guard let groupImageURL = NSURL(string: groupImageURL_raw) else {
                fatalError()
            }
            self.groupImageURL = groupImageURL
        } else if rawData["GroupImage"] is NSNull {
            self.groupImageURL = NSURL(string: "")
        } else { // Debug
            self.groupImageURL = NSURL(string: "")
        }
        
    }
}
