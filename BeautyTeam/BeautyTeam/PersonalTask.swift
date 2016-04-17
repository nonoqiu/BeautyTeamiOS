//
//  PersonalTask.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/16/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation

class PersonalTask: Task {
    var obisoftUserId: String?
    
    required init(rawData: [String : AnyObject?]) {
        super.init(rawData: rawData)
        guard let obisoftUserId = rawData["ObisoftUserId"] as? String else {
            fatalError()
        }
        self.obisoftUserId = obisoftUserId
    }
}
