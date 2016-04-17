//
//  ObisoftUser.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/16/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation

class ObisoftUser: InitialProtocol {
    var nickName: String?
    var iconImageURL: NSURL?
    var description: String?
    
    var schoolId: Int?
    var schoolAccount: String?
    var schoolPassAes: String?
    var schoolBinded: Bool = false
    var schoolAccountSet: Bool = false
    
    var groupUserRelations: [GroupUserRelation] = [GroupUserRelation]()
    var teamUserRelations: [TeamUserRelation] = [TeamUserRelation]()
    var teamEventRelations: [TeamEventRelation] = [TeamEventRelation]()
    
    var personalTasks: [PersonalTask] = [PersonalTask]()
    var personalEvents: [PersonalEvent] = [PersonalEvent]()
    
    required init(rawData: [String : AnyObject?]) {
        
    }
}
