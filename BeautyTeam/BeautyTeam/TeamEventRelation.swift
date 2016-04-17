//
//  TeamEventRelation.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/16/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation

// EU_Relation
class TeamEventRelation: InitialProtocol {
    var teamEventRelationId: Int!
    var groupEventEventId: Int!
    var obisoftUserId: String!
    
    required init(rawData: [String : AnyObject?]) {
        guard let teamEventRelationId = rawData["TU_RelationId"] as? Int else {
            fatalError()
        }
        guard let groupEventEventId = rawData["GroupEventEventId"] as? Int else {
            fatalError()
        }
        guard let obisoftUserId = rawData["ObisoftUserId"] as? String else {
            fatalError()
        }
        
        self.teamEventRelationId = teamEventRelationId
        self.groupEventEventId = groupEventEventId
        self.obisoftUserId = obisoftUserId
    }
}
