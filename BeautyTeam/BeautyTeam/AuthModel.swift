//
//  AuthModel.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/20/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation
import Alamofire

class AuthModel: NSObject {
    var userName: String
    var password: String
    var confirmPassword: String!
    var rememberMe: Bool!
    
    init(userName: String, password: String, confirmPassword: String) {
        self.userName = userName
        self.password = password
        self.confirmPassword = confirmPassword
    }
    
    init(userName: String, password: String, rememberMe: Bool) {
        self.userName = userName
        self.password = password
        self.rememberMe = rememberMe
    }
    
    func login() {
        
    }
}
