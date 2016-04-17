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
    var schoolBinded: Bool?
    var schoolAccountSet: Bool?
    
    var groupUserRelations: [GroupUserRelation] = [GroupUserRelation]()
    var teamUserRelations: [TeamUserRelation] = [TeamUserRelation]()
    var teamEventRelations: [TeamEventRelation] = [TeamEventRelation]()
    
    var personalTasks: [PersonalTask] = [PersonalTask]()
    var personalEvents: [PersonalEvent] = [PersonalEvent]()
    
    required init(rawData: [String : AnyObject?]) {
        guard let nickName = rawData["NickName"] as? String else {
            fatalError()
        }
        guard let iconImageURL_raw = rawData["IconImage"] as? String else {
            fatalError()
        }
        guard let iconImageURL = NSURL(string: iconImageURL_raw) else {
            fatalError()
        }
        guard let description = rawData["Description"] as? String else {
            fatalError()
        }
        guard let schoolId = rawData["SchoolId"] as? Int else {
            fatalError()
        }
        
        self.nickName = nickName
        self.iconImageURL = iconImageURL
        self.description = description
        self.schoolId = schoolId
        self.schoolAccount = rawData["SchoolAccount"] as? String
        self.schoolPassAes = rawData["SchoolPassAes"] as? String
        self.schoolBinded = rawData["SchoolBinded"] as? Bool
        self.schoolAccountSet = rawData["SchoolAccountSet"] as? Bool
        
    }
}
