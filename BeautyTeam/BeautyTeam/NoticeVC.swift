//
//  NoticeVC.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/21/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit
import Alamofire

class NoticeVC: UITableViewController, FetchDataFromNetworkProtocol {
    
    var rightNavigationPopItem: NoticeRightNavigationItemPopMenu?
    var notices = [INoticable]()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.whiteColor()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.title = "BeautyTeam"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addButtonPress))
        
        self.rightNavigationPopItem = NoticeRightNavigationItemPopMenu(frame: CGRectMake(ObiBeautyTeam.deviceWidth - 200, 0, 200, NoticeRightNavigationItemPopMenu.itemHeight * 3), style: .Plain)
        self.rightNavigationPopItem?.hidden = true
        self.rightNavigationPopItem?.jumpDelegate = self
        self.rightNavigationPopItem?.layer.borderWidth = 1
        self.rightNavigationPopItem?.layer.borderColor = UIColor.greenColor().CGColor
        self.rightNavigationPopItem?.layer.cornerRadius = 4
        
        // Listener to collapse down menu
//        let listener = UITapGestureRecognizer(target: self, action: #selector(collapseDownMenu))
//        listener.numberOfTapsRequired = 1
//        listener.numberOfTouchesRequired = 1
        
        self.view.addSubview(rightNavigationPopItem!)
//        self.tableView.addGestureRecognizer(listener)
    }
    
    func fetchData() {
        ObiBeautyTeam.checkSignInStatusBeforeHandlingNetwork(after: {
            Alamofire.request(.GET, ObiBeautyTeam.APIURL + "/AllNoticeForMe").responseJSON(completionHandler: {
                [weak self] resp in
                
                guard let JSONdata = resp.result.value as? Dictionary<String, AnyObject?> else {
                    return
                }
                let noticeDataRawNotice = ObiList<INoticable>(rawData: JSONdata)
                self?.notices = noticeDataRawNotice.list
                self?.performSelectorOnMainThread(#selector(self?.tableView.reloadData), withObject: nil, waitUntilDone: false)
            })
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addButtonPress() {
        // Define Down Menu
        if self.rightNavigationPopItem!.hidden {
            self.rightNavigationPopItem!.hidden = false
        } else {
            self.rightNavigationPopItem!.hidden = true
        }
    }
    
    func collapseDownMenu() {
        self.rightNavigationPopItem?.hidden = true
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.notices.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        collapseDownMenu()
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
