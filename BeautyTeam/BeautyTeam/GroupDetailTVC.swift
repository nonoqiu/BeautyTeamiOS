//
//  GroupDetailTVC.swift
//  BeautyTeam
//
//  Created by Carl Lee on 5/22/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit
import Async
import Alamofire
import Alamofire_Synchronous

class GroupDetailTVC: UITableViewController {
    
    // @ExternalSet
    var group: Group?
    
    var firstLineCell = GroupDetailFirstLineTableViewCell(style: .Default, reuseIdentifier: nil)
    var membersCell = GroupDetailMembersLineTableViewCell(style: .Default, reuseIdentifier: nil)
    var membersID = [String]()
    var membersViewModel = Array<GroupUserTableViewModel>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Detect if self.group is nil
        guard self.group != nil else {
            fatalError()
        }
        
        self.navigationItem.title = "Detail"
        
        print(group!.groupName!)
        print(group!.groupImageURL!.description)
        self.firstLineCell.assignValue(group!.groupName!, ownerName: "Waiting...", adminName: "Waiting...", groupImageURL: group!.groupImageURL!)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Need to get user information using the `GU_Relation`s.
        Async.background {
            for element in self.group!.groupUserRelation {
                self.membersViewModel.append(GroupUserTableViewModel(ObisoftUserId: element.obisoftUserId))
            }
            // TODO: Finish members loading in collectionView.
            let asyncGroup = AsyncGroup()
            for i in 0..<self.membersViewModel.count {
                asyncGroup.background {
                    let respDic = Alamofire.request(.GET, ObiBeautyTeam.APIURL + "/AnotherUser/\(self.membersViewModel[i].ObisoftUserId!)").responseJSON().result.value as! Dictionary<String, AnyObject>
                    print(respDic)
                    let res = ObiObject<ObisoftAnotherUser>(rawData: respDic)
                    self.membersViewModel[i].user = res.object
                }
            }
            asyncGroup.wait()
            // Assign to down view
            self.membersCell.members = self.membersViewModel
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return self.firstLineCell
        case 1:
            return self.membersCell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 136
        case 1:
            return 302
        default:
            return 0
        }
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
