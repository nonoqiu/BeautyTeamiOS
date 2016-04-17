//
//  RadioTask.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/17/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation

class RadioTask: Task {
    var radioStationGroupId: Int!
    
    required init(rawData: [String : AnyObject?]) {
        super.init(rawData: rawData)
        guard let radioStationGroupId = rawData["RadioStationGroupId"] as? Int else {
            fatalError()
        }
        
        self.radioStationGroupId = radioStationGroupId
    }
}
