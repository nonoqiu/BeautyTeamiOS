//
//  ObiBeautyTeam.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/20/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation
import Alamofire
import KeychainSwift

struct ObiBeautyTeam {
    
    static var APIURL: String {
        get {
            return "https://www.obisoft.com.cn/api"
        }
    }
    
    static func ObiDateFormatter() -> NSDateFormatter {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/mm/dd HH:mm:SS"
        return dateFormatter
    }
    
    static func logError(errorDescription: String) {
        guard let version = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as? String else {
            return
        }
        Alamofire.request(.POST, ObiBeautyTeam.APIURL + "/Log", parameters: [
                "HappenTime": ObiBeautyTeam.ObiDateFormatter().stringFromDate(NSDate(timeIntervalSinceNow: 0)),
                "Description": errorDescription,
                "HappenPlatform": "ios",
                "version": "v\(version)"
            ]).responseJSON {
                response in
                
                print(response.result.value)
        }
    }
    
    static var deviceWidth: CGFloat {
        get {
            return UIScreen.mainScreen().bounds.width
        }
    }
    
    static var deviceHeight: CGFloat {
        get {
            return UIScreen.mainScreen().bounds.height
        }
    }
    
    static func throughAllString(str: String) -> NSRange {
        return NSMakeRange(0, str.characters.count)
    }
    
    static var tabBarControllerOnce: dispatch_once_t = 0
    static func sharedTabBarController() -> UITabBarController {
        struct Static {
            static var instance: UITabBarController!
        }
        dispatch_once(&ObiBeautyTeam.tabBarControllerOnce, {
            let notice = UINavigationController(rootViewController: NoticeVC(style: .Grouped))
            let team = UINavigationController(rootViewController: TeamVC(style: .Grouped))
            let main = UINavigationController(rootViewController: MainVC(style: .Grouped))
            
            Static.instance = UITabBarController()
            
            Static.instance.addChildViewController(notice)
            Static.instance.addChildViewController(team)
            Static.instance.addChildViewController(main)
        })
        return Static.instance
    }
    
    static var signInSignature: String {
        get {
            return "ObiBeautyTeam_SignedIn"
        }
    }
    
    static func silentCheckSignIn() {
        
    }
    
    static func silentSignIn(after after: () -> Void) {
        let userDefault = NSUserDefaults.standardUserDefaults()
        
        let keychain = KeychainSwift()
        guard let username = keychain.get("username") else {
            userDefault.setBool(false, forKey: ObiBeautyTeam.signInSignature)
            userDefault.synchronize()
            return
        }
        guard let password = keychain.get("password") else {
            userDefault.setBool(false, forKey: ObiBeautyTeam.signInSignature)
            userDefault.synchronize()
            return
        }
        
        Alamofire.request(.POST, ObiBeautyTeam.APIURL + "/Login", parameters: ["Email" : username, "Password" : password])
            .responseJSON {
                resp in
                
                // Parse
                guard let rawData = resp.result.value as? Dictionary<String, AnyObject?> else {
                    userDefault.setBool(false, forKey: ObiBeautyTeam.signInSignature)
                    userDefault.synchronize()
                    return
                }
                let loginValue = ObiValue<String>(rawData: rawData)
                
                if loginValue.statusCode != 200 {
                    userDefault.setBool(false, forKey: ObiBeautyTeam.signInSignature)
                    userDefault.synchronize()
                    return
                } else {
                    userDefault.setBool(true, forKey: ObiBeautyTeam.signInSignature)
                    userDefault.synchronize()
                }
                
                after()
        }
    }
    
    static func checkSignInStatusBeforeHandlingNetwork(after after: () -> Void) {
        let userDefault = NSUserDefaults.standardUserDefaults()
        
        Alamofire.request(.GET, ObiBeautyTeam.APIURL + "/loginstatus").responseJSON {
            resp in
            
            guard let rawData = resp.result.value as? Dictionary<String, AnyObject?> else {
                userDefault.setBool(false, forKey: ObiBeautyTeam.signInSignature)
                userDefault.synchronize()
                return
            }
            let checkSignIn = ObiValue<Bool>(rawData: rawData)
            if checkSignIn.statusCode != 200 {
                userDefault.setBool(false, forKey: ObiBeautyTeam.signInSignature)
                userDefault.synchronize()
                return
            }
            if !checkSignIn.value {
                ObiBeautyTeam.silentSignIn(after: after)
            } else {
                after()
            }
        }
    }
    
}
