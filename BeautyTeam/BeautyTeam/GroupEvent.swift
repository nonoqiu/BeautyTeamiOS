//
//  GroupEvent.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/17/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class GroupEvent: Event {
    var projectId: Int!
    var teamEventRelation: [TeamEventRelation] = [TeamEventRelation]()
    
    required init(rawData: [String : AnyObject?]) {
        super.init(rawData: rawData)
        guard let projectId = rawData["ProjectId"] as? Int else {
            fatalError()
        }
        guard let teamEventRelation_raw = rawData["EU_Relation"] as? [[String : AnyObject?]] else {
            fatalError()
        }
        
        self.projectId = projectId
        for element in teamEventRelation_raw {
            self.teamEventRelation.append(TeamEventRelation(rawData: element))
        }
    }
}
