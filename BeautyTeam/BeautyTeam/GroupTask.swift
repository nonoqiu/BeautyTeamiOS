//
//  GroupTask.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/17/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class GroupTask: Task {
    var projectId: Int!
    var teamUserRelation: [TeamUserRelation] = [TeamUserRelation]()
    
    required init(rawData: [String : AnyObject?]) {
        super.init(rawData: rawData)
        guard let projectId = rawData["ProjectId"] as? Int else {
            fatalError()
        }
        guard let teamUserRelation_raw = rawData["TeamUserRelation"] as? [[String : AnyObject?]] else {
            fatalError()
        }
        
        self.projectId = projectId
        for element in teamUserRelation_raw {
            self.teamUserRelation.append(TeamUserRelation(rawData: element))
        }
    }
}
