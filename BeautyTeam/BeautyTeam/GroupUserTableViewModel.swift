//
//  GroupUserTableViewModel.swift
//  BeautyTeam
//
//  Created by Carl Lee on 5/22/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation
import Alamofire
import Alamofire_Synchronous

struct GroupUserTableViewModel: NetworkReachableViewModelProtocol {
    var ObisoftUserId: String?
    var user: ObisoftAnotherUser?
    
    init(ObisoftUserId: String) {
        self.ObisoftUserId = ObisoftUserId
    }
    
    mutating func fetchNextDataSynchronous() {
        guard ObisoftUserId != nil else {
            return
        }
        let resp = Alamofire.request(.GET, ObiBeautyTeam.APIURL + "/AnotherUser/\(ObisoftUserId!)").responseJSON()
        guard let dic = resp.result.value as? Dictionary<String, AnyObject> else {
            fatalError()
        }
        self.user = ObisoftAnotherUser(rawData: dic)
    }
}
