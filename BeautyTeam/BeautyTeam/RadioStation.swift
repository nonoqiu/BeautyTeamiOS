//
//  RadioStation.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/17/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation

class RadioStation: Group {
    var radioEvents: [RadioEvent] = [RadioEvent]()
    var radioTasks: [RadioTask] = [RadioTask]()
    
    required init(rawData: [String : AnyObject?]) {
        super.init(rawData: rawData)
        guard let radioEvents_raw = rawData["RadioEvents"] as? [[String : AnyObject?]] else {
            fatalError()
        }
        guard let radioTasks_raw = rawData["RadioTasks"] as? [[String : AnyObject?]] else {
            fatalError()
        }
        
        for element in radioEvents_raw {
            self.radioEvents.append(RadioEvent(rawData: element))
        }
        for element in radioTasks_raw {
            self.radioTasks.append(RadioTask(rawData: element))
        }
    }
}
