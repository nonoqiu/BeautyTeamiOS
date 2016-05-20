//
//  TeamVC.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/21/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit
import Async
import Alamofire
import Alamofire_Synchronous
import PinYin4Objc

class TeamVC: UITableViewController {
    
    var GU_Relations = [GroupUserRelation]()
    var groups = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(GroupTableViewCell.self, forCellReuseIdentifier: "GroupTVC")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let debugLogin = Alamofire.request(.POST, ObiBeautyTeam.APIURL + "/Login", parameters: ["Email" : "hkyla@obisoft.com.cn", "Password" : "1234567890"]).responseJSON()
        
//        self.view.backgroundColor = UIColor.whiteColor()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.title = "Team"
        
        ObiBeautyTeam.checkSignInStatusBeforeHandlingNetwork(#selector(TeamVC.dataLoad), target: self, withObject: nil)
        
    }
    
    func dataLoad() {
        Alamofire.request(.GET, ObiBeautyTeam.APIURL + "/Groupsijoined").responseJSON {
            resp in
            
            guard let dic = resp.result.value as? Dictionary<String, AnyObject> else {
                fatalError()
            }
            let res = ObiList<GroupUserRelation>(rawData: dic)
            for element in res.list {
                
            }
            self.tableView.performSelectorOnMainThread(#selector(UITableView.reloadData), withObject: nil, waitUntilDone: false)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // WARNING: Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.groups.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier")
        if (cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "reuseIdentifier")
        }

        let rowLocation = indexPath.row
        cell!.textLabel?.text = groups[rowLocation].groupName

        return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
