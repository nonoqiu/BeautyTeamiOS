//
//  Task.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/16/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class Task: INoticable {
    var taskID: Int!
    var taskName: String!
    var taskContent: String!
    var deadline: String!
    
    required init(rawData: [String : AnyObject?]) {
        super.init(rawData: rawData)
        guard let taskID_raw = rawData["TaskID"] as? Int else {
            fatalError()
        }
        guard let taskName_raw = rawData["TaskName"] as? String else {
            fatalError()
        }
        guard let taskContent_raw = rawData["TaskContent"] as? String else {
            fatalError()
        }
        guard let deadline_raw = rawData["Deadline"] as? String else {
            fatalError()
        }
        
        self.taskID = taskID_raw
        self.taskName = taskName_raw
        self.taskContent = taskContent_raw
        self.deadline = deadline_raw
    }
}
