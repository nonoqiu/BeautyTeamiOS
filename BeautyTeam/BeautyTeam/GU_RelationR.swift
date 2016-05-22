//
//  GU_RelationR.swift
//  BeautyTeam
//
//  Created by Carl Lee on 5/22/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class GU_RelationR: InitialProtocol {
    
    var GU_RelationId: Int!
    var ObisoftUserId: String!
    var ObisoftUsr: ObisoftUser!
    var groupId: Int!
    var group: Group!
    var relationType: GroupUserRelationType!
    var createrName: String!
    var createrID: String!
    
    required init(rawData: [String : AnyObject?]) {
        guard let GU_RelationId = rawData["GU_RelationId"] as? Int else {
            fatalError()
        }
        guard let ObisoftUserId = rawData["ObisoftUserId"] as? String else {
            fatalError()
        }
        guard let groupId = rawData["GroupId"] as? Int else {
            fatalError()
        }
        guard let group_raw = rawData["Group"] as? Dictionary<String, AnyObject> else {
            fatalError()
        }
        guard let relationType_raw = rawData["RelationType"] as? Int else {
            fatalError()
        }
        guard let createrName = rawData["CreaterName"] as? String else {
            fatalError()
        }
        guard let createrID = rawData["CreaterID"] as? String else {
            fatalError()
        }
        
        guard let relationType = GroupUserRelationType(rawValue: relationType_raw) else {
            fatalError()
        }
        
        self.GU_RelationId = GU_RelationId
        self.ObisoftUserId = ObisoftUserId
        self.groupId = groupId
        self.group = Group(rawData: group_raw)
        self.createrName = createrName
        self.createrID = createrID
        self.relationType = relationType
    }
    
}
