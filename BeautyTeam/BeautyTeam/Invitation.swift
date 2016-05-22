//
//  Invitation.swift
//  BeautyTeam
//
//  Created by Carl Lee on 5/22/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class Invitation: InitialProtocol {
    
    var invitationId: Int
    
    var groupId: Int
    var group: Group
    
    var obisoftUserId: String
    var obisoftUser: ObisoftUser
    
    required init(rawData: [String : AnyObject?]) {
        guard let invitationId = rawData["InvitationId"] as? Int else {
            fatalError()
        }
        guard let groupId = rawData["GroupId"] as? Int else {
            fatalError()
        }
        guard let group_raw = rawData["Group"] as? Dictionary<String, AnyObject?> else {
            fatalError()
        }
        guard let obisoftUserId = rawData["ObisoftUserId"] as? String else {
            fatalError()
        }
        guard let obisoftUser_raw = rawData["ObisoftUser"] as? Dictionary<String, AnyObject?> else {
            fatalError()
        }
        
        self.invitationId = invitationId
        self.groupId = groupId
        self.group = Group(rawData: group_raw)
        self.obisoftUserId = obisoftUserId
        self.obisoftUser = ObisoftUser(rawData: obisoftUser_raw)
    }
    
}
