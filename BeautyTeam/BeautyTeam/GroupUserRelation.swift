//
//  GroupUserRelation.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/16/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class GroupUserRelation: NSObject, InitialProtocol {
    var groupUserRelationId: Int!
    var obisoftUserId: String!
    var groupId: Int!
    var relationType: GroupUserRelationType!
    
    required init(rawData: [String : AnyObject?]) {
        guard let groupUserRelationId = rawData["GU_RelationId"] as? Int else {
            fatalError()
        }
        guard let obisoftUserId = rawData["ObisoftUserId"] as? String else {
            fatalError()
        }
        guard let groupId = rawData["GroupId"] as? Int else {
            fatalError()
        }
        guard let relationType_raw = rawData["RelationType"] as? Int else {
            fatalError()
        }
        guard let relationType = GroupUserRelationType(rawValue: relationType_raw) else {
            fatalError()
        }
        
        self.groupUserRelationId = groupUserRelationId
        self.obisoftUserId = obisoftUserId
        self.groupId = groupId
        self.relationType = relationType
    }
}
