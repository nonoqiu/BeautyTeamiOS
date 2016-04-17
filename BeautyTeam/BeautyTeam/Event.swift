//
//  Event.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/15/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation

class Event: INoticable {
    var eventId: Int!
    var eventName: String!
    var eventContent: String!
    
    var happenTime: String!
    var endTime: String!
    var costTime: String!
    
    required init(rawData: [String : AnyObject?]) {
        super.init(rawData: rawData)
        guard let eventId_raw = rawData["EventId"] as? Int else {
            fatalError()
        }
        guard let eventName_raw = rawData["EventName"] as? String else {
            fatalError()
        }
        guard let eventContent_raw = rawData["EventContent"] as? String else {
            fatalError()
        }
        guard let happenTime_raw = rawData["HappenTime"] as? String else {
            fatalError()
        }
        guard let endTime_raw = rawData["EndTime"] as? String else {
            fatalError()
        }
        guard let costTime_raw = rawData["CostTime"] as? String else {
            fatalError()
        }
        
        self.eventId = eventId_raw
        self.eventName = eventName_raw
        self.eventContent = eventContent_raw
        self.happenTime = happenTime_raw
        self.endTime = endTime_raw
        self.costTime = costTime_raw
    }
}
