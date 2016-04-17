//
//  Project.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/17/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation

class Project: InitialProtocol {
    var projectId: Int!
    var groupId: Int!
    
    var projectName: String!
    var projectDescription: String!
    var projectEvents: [GroupEvent] = [GroupEvent]()
    var projectTasks: [GroupTask] = [GroupTask]()
    
    required init(rawData: [String : AnyObject?]) {
        guard let projectId = rawData["ProjectId"] as? Int else {
            fatalError()
        }
        guard let groupId = rawData["GroupId"] as? Int else {
            fatalError()
        }
        guard let projectName = rawData["ProjectName"] as? String else {
            fatalError()
        }
        guard let projectDescription = rawData["ProjectDescription"] as? String else {
            fatalError()
        }
        
        guard let projectEvents_raw = rawData["ProjectEvents"] as? [[String : AnyObject?]] else {
            fatalError()
        }
        guard let projectTasks_raw = rawData["ProjectTasks"] as? [[String : AnyObject?]] else {
            fatalError()
        }
        
        self.projectId = projectId
        self.groupId = groupId
        self.projectName = projectName
        self.projectDescription = projectDescription
        
        for element in projectEvents_raw {
            self.projectEvents.append(GroupEvent(rawData: element))
        }
        for element in projectTasks_raw {
            self.projectTasks.append(GroupTask(rawData: element))
        }
    }
}
