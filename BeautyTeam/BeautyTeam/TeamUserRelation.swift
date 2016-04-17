//
//  TeamUserRelation.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/16/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation

class TeamUserRelation: InitialProtocol {
    var teamUserRelationId: Int!
    var groupTaskTaskId: Int!
    var obisoftUserId: String!
    
    required init(rawData: [String : AnyObject?]) {
        guard let teamUserRelationId = rawData["TU_RelationId"] as? Int else {
            fatalError()
        }
        guard let groupTaskTaskId = rawData["GroupTaskTaskId"] as? Int else {
            fatalError()
        }
        guard let obisoftUserId = rawData["ObisoftUserId"] as? String else {
            fatalError()
        }
        
        self.teamUserRelationId = teamUserRelationId
        self.groupTaskTaskId = groupTaskTaskId
        self.obisoftUserId = obisoftUserId
    }
}
