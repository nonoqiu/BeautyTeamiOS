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
        manager.request(.GET, "https://www.obisoft.com.cn/api/").responseJSON(completionHandler: {
            resp in
            
            print(resp.request)
            print(resp.response)
            print(resp.data)
            print(resp.result)
            
            guard let JSON = resp.result.value else {
                return
            }
            print(JSON)
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

