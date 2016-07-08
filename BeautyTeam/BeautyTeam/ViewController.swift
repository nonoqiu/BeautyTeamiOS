//
//  ViewController.swift
//  BeautyTeam
//
//  Created by 李昂 on 3/29/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        Alamofire.request(.GET, "https://www.obisoft.com.cn/api/").responseJSON(completionHandler: {
//            resp in
//            
//            print(resp.request)
//            print(resp.response)
//            print(resp.data)
//            print(resp.result)
//            
//            guard let JSON = resp.result.value else {
//                return
//            }
//            print(JSON)
//        })
        
//        Alamofire.request(.POST, "https://www.obisoft.com.cn/api/Register", parameters: [
//            "Email": "hkyla@obisoft.com.cn",
//            "Password": "FbK7xr.fE9H/fh",
//            "ConfirmPassword": "FbK7xr.fE9H/fh"
//        ]).responseJSON {
//            resp in
//            
//            guard let json = resp.result.value else {
//                return
//            }
//            print(json)
//        }
        
//        Alamofire.request(.POST, "https://www.obisoft.com.cn/api/Login", parameters: [
//                "Email": "hkyla@obisoft.com.cn",
//                "Password": "Kn^GGs6R6hcbm#",
//                "RememberMe": true.description
//            ]).responseJSON {
//                resp in
//                
//                guard let json = resp.result.value else {
//                    return
//                }
//                print(json)
//        }
//
//        Alamofire.request(.POST, "https://www.obisoft.com.cn/api/Log", parameters: [
//                "HappenTime": "2016/4/12 15:00:00",
//                "Description": "Blame the user",
//                "HappenPlatform": "ios",
//                "version": "v1.0.0"
//            ]).responseJSON {
//                resp in
//                
//                guard let json = resp.result.value else {
//                    return
//                }
//                print(json)
//        }
        
//        Alamofire.request(.POST, "https://www.obisoft.com.cn/api/ForgotPassword", parameters: [
//                "Email": "hkyla@obisoft.com.cn",
//                "ByEmailNotBySms": true.description
//            ]).responseJSON {
//                resp in
//                
//                guard let json = resp.result.value else {
//                    fatalError()
//                }
//                print(json)
//        }
        
        Alamofire.request(.POST, "https://www.obisoft.com.cn/api/ChangePassword/", parameters: [
                "OldPassword": "Kn^GGs6", // Kn^GGs6R6hcbm#
                "NewPassword": "123456",
                "ConfirmPassword": "123456"
            ]).responseJSON {
                resp in
                
                guard let json = resp.result.value else {
                    fatalError()
                }
                print(json)
        }
        
        Alamofire.request(.POST, "https://www.obisoft.com.cn/api/SetSchoolAccount", parameters: [
                "Account": "20155134",
                "Password": "1q2w3e4r"
            ]).responseJSON {
            resp in
            
            guard let json = resp.result.value else {
                fatalError()
            }
            print(json)
        }
        
//        Alamofire.request(.GET, "https://www.obisoft.com.cn/api/latestversion", parameters: [
//                "Platform": "ios",
//                "CurrentVersion": "v0.0.1"
//            ]).responseJSON {
//                resp in
//                
//                guard let json = resp.result.value else {
//                    return
//                }
//                print(json)
//        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
