//
//  TeamVC.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/21/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

// GPG Test

import UIKit
import Async
import Alamofire
import Alamofire_Synchronous
import PinYin4Objc

class TeamVC: UITableViewController {
    
    var groups = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(GroupTableViewCell.self, forCellReuseIdentifier: "GroupTVC")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Right navigator
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(TeamVC.goAddGroup))
        
        let debugLogin = Alamofire.request(.POST, ObiBeautyTeam.APIURL + "/Login", parameters: ["Email" : "hkyla@obisoft.com.cn", "Password" : "1234567890"]).responseJSON().result.value as? Dictionary<String, AnyObject>
        print(debugLogin)
        print("=====Login=====")
        
//        self.view.backgroundColor = UIColor.whiteColor()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.title = "Team"
        
        ObiBeautyTeam.checkSignInStatusBeforeHandlingNetwork(#selector(TeamVC.dataLoad), target: self, withObject: nil)
        
    }
    
    func goAddGroup() {
        let nextVC = AddGroupTVC(style: .Grouped)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func dataLoad() {
        Alamofire.request(.GET, ObiBeautyTeam.APIURL + "/Groupsijoined").responseJSON {
            resp in
            
            guard let dic = resp.result.value as? Dictionary<String, AnyObject> else {
                fatalError()
            }
            print(dic)
            let res = ObiList<GU_RelationR>(rawData: dic)
            for element in res.list {
                self.groups.append(element.group)
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
            cell = UITableViewCell(style: .Value1, reuseIdentifier: "reuseIdentifier")
        }

        let rowLocation = indexPath.row
        cell!.textLabel?.text = groups[rowLocation].groupName
        cell?.accessoryType = .DisclosureIndicator
        cell?.detailTextLabel?.text = groups[rowLocation].groupDescription
        
//        let groupTVC = tableView.dequeueReusableCellWithIdentifier("GroupTVC", forIndexPath: indexPath) as! GroupTableViewCell
//        let dataElement = groups[indexPath.row]
//        groupTVC.assignValue(dataElement.groupImageURL != nil ? dataElement.groupImageURL! : NSURL(), groupName: dataElement.groupName!, groupMemberCount: 1)
//        return groupTVC

        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let detailTVC = GroupDetailTVC(style: .Grouped)
        detailTVC.group = groups[indexPath.row]
        self.navigationController?.pushViewController(detailTVC, animated: true)
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
