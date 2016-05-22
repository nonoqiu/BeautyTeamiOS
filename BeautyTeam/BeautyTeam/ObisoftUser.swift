//
//  ObisoftUser.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/16/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation

class ObisoftUser: ObisoftAnotherUser {
    
    var schoolId: Int?
    var schoolAccount: String!
    var schoolPassAes: String!
    var schoolBinded: Bool!
    var schoolAccountSet: Bool!
    
    var GU_Relations = [GroupUserRelation]()
    var TU_Relations = [TeamUserRelation]()
    var EU_Relations = [TeamEventRelation]()
    var personalTasks = [PersonalTask]()
    var personalEvents = [PersonalEvent]()
    
    var allowSeeImFree: Bool!
    var allowSeeWhatImDoing: Bool!
    var allowAddtoMyCalendar: Bool!
    var allowSeeMySchoolAndAccount: Bool!
    
    var openid: String!
    
    required init(rawData: [String : AnyObject?]) {
        super.init(rawData: rawData)
        if let _ = rawData["SchoolId"] as? NSNull {
            self.schoolId = nil
        } else {
            guard let schoolId = rawData["SchoolId"] as? Int else {
                fatalError()
            }
            self.schoolId = schoolId
        }
        
        if let _ = rawData["SchoolAccount"] as? NSNull {
            self.schoolAccount = ""
        } else {
            guard let schoolAccount = rawData["SchoolAccount"] as? String else {
                fatalError()
            }
            self.schoolAccount = schoolAccount
        }
        
        if let _ = rawData["SchoolPassAes"] as? NSNull {
            self.schoolPassAes = ""
        } else {
            guard let schoolPassAes = rawData["SchoolPassAes"] as? String else {
                fatalError()
            }
            self.schoolPassAes = schoolPassAes
        }
        
        guard let schoolBinded = rawData["SchoolBinded"] as? Bool else {
            fatalError()
        }
        guard let schoolAccountSet = rawData["SchoolAccountSet"] as? Bool else {
            fatalError()
        }
        
        guard let GU_Relations_raw = rawData["GU_Relations"] as? Array<Dictionary<String, AnyObject>> else {
            fatalError()
        }
        guard let TU_Relations_raw = rawData["TU_Relations"] as? Array<Dictionary<String, AnyObject>> else {
            fatalError()
        }
        guard let EU_Relations_raw = rawData["EU_Relations"] as? Array<Dictionary<String, AnyObject>> else {
            fatalError()
        }
        
        guard let allowSeeImFree = rawData["AllowSeeImFree"] as? Bool else {
            fatalError()
        }
        guard let allowSeeWhatImDoing = rawData["AllowSeeWhatImDoing"] as? Bool else {
            fatalError()
        }
        guard let allowAddtoMyCalendar = rawData["AllowAddtoMyCalendar"] as? Bool else {
            fatalError()
        }
        guard let allowSeeMySchoolAndAccount = rawData["AllowSeeMySchoolAndAccount"] as? Bool else {
            fatalError()
        }
        
        guard let openid = rawData["openid"] as? String else {
            fatalError()
        }
        
        self.schoolBinded = schoolBinded
        self.schoolAccountSet = schoolAccountSet
        
        for element in GU_Relations_raw {
            self.GU_Relations.append(GroupUserRelation(rawData: element))
        }
        for element in TU_Relations_raw {
            self.TU_Relations.append(TeamUserRelation(rawData: element))
        }
        for element in EU_Relations_raw {
            self.EU_Relations.append(TeamEventRelation(rawData: element))
        }
        
        self.allowSeeImFree = allowSeeImFree
        self.allowSeeMySchoolAndAccount = allowSeeMySchoolAndAccount
        self.allowAddtoMyCalendar = allowAddtoMyCalendar
        self.allowSeeWhatImDoing = allowSeeWhatImDoing
        
        self.openid = openid
    }
    
}
