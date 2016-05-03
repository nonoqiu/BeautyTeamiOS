//
//  INoticable.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/15/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation

enum NoticeType: String {
    case Task = "Task"
    case Event = "Event"
}

class INoticable: InitialProtocol {
    var before: String
    var noticeDate: String
    var noticeName: String
    var noticeContent: String
    var typeName: NoticeType
    
    required init(rawData: [String : AnyObject?]) {
        guard let before_raw = rawData["Before"] as? String else {
            fatalError()
        }
        guard let noticeDate_raw = rawData["NoticeDate"] as? String else {
            fatalError()
        }
        guard let noticeName_raw = rawData["NoticeName"] as? String else {
            fatalError()
        }
        guard let noticeContent_raw = rawData["NoticeContent"] as? String else {
            fatalError()
        }
        guard let typeName_raw = rawData["TypeName"] as? String else {
            fatalError()
        }
        guard let typeName = NoticeType(rawValue: typeName_raw) else {
            fatalError()
        }
        self.before = before_raw
        self.noticeDate = noticeDate_raw
        self.noticeName = noticeName_raw
        self.noticeContent = noticeContent_raw
        self.typeName = typeName
    }
}
