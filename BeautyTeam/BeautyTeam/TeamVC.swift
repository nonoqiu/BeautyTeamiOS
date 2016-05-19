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

class TeamVC: UITableViewController {
    
    var GU_Relations = [GroupUserRelation]()
    var groups = [Group]()
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
        
        
        
//        Alamofire.request(.GET, ObiBeautyTeam.APIURL + "/Groupsijoined").responseJSON {
//            resp in
//            
//            guard let returnJSON = resp.result.value as? Dictionary<String, AnyObject> else {
//                fatalError()
//            }
//            let NSDicEncodedJSON = NSDictionary(dictionary: returnJSON)
//            NSNotificationCenter.defaultCenter().postNotificationName("getGroupDetails", object: NSDicEncodedJSON)
//        }
        
        
        
    }
    
    func getGroupDetailsIntoSelfArray() {
        Async.background {
            let group = AsyncGroup()
            for element in self.GU_Relations {
                group.background {
                    let resp = Alamofire.request(.GET, ObiBeautyTeam.APIURL + "/GroupDetails/\(element.groupId)").responseJSON()
                    guard let data = resp.result.value as? Dictionary<String, AnyObject> else {
                        print(resp.result.value)
                        fatalError()
                    }
                    let rawData = ObiObject<Group>(rawData: data)
                    let singleGroup = rawData.object
                    self.groups.append(singleGroup)
                }
            }
            group.wait()
        }
            .main {
                self.tableView.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let debugLogin = Alamofire.request(.POST, ObiBeautyTeam.APIURL + "/Login", parameters: ["Email" : "hkyla@obisoft.com.cn", "Password" : "1234567890"]).responseJSON()
        
//        self.view.backgroundColor = UIColor.whiteColor()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.title = "Team"
        
        // Load data
        Async.background {
            let resp = Alamofire.request(.GET, ObiBeautyTeam.APIURL + "/Groupsijoined").responseJSON()
            print(resp.result.value)
            guard let rJSON = resp.result.value as? Dictionary<String, AnyObject> else {
                fatalError()
            }
            // Parse
            let raw = ObiList<GroupUserRelation>(rawData: rJSON)
            self.GU_Relations = raw.list
            }
            .main {
                self.getGroupDetailsIntoSelfArray()
        }
        
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
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
