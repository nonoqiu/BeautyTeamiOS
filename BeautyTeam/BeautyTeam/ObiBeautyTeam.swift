//
//  ObiBeautyTeam.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/20/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import Foundation
import Alamofire

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
    
}