//
//  ObiLoginVC.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/20/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit
import Alamofire
import KeychainSwift

class ObiLoginVC: UITableViewController {
    
    var userNameCell: InputTableViewCell!
    var passwordCell: InputTableViewCell!
    var rememberMeCell: UITableViewCell!
    var loginCell: UITableViewCell!
    
    var loginIndicate: UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.registerClass(InputTableViewCell.self, forCellReuseIdentifier: "inputcell")
        
        self.userNameCell = InputTableViewCell(name: "User name", reuseIdentifier: "inputcell")
        self.passwordCell = InputTableViewCell(name: "Password", isPassword: true, reuseIdentifier: "inputcell")
        self.rememberMeCell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        self.rememberMeCell.textLabel?.text = "Remember me"
        self.rememberMeCell.accessoryType = .Checkmark
        self.loginCell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        self.loginCell.textLabel?.text = "Sign in"
        
        self.navigationItem.title = "Sign in"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.loginIndicate)
        self.loginIndicate.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 5 = User name + password + remember me + Login
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return self.userNameCell
            case 1:
                return self.passwordCell
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                return self.rememberMeCell
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                return self.loginCell
            default:
                break
            }
        default:
            break
        }
        return UITableViewCell()
    }
 
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.section == 1 {
            if self.rememberMeCell.accessoryType == .None {
               self.rememberMeCell.accessoryType = .Checkmark
            } else {
                self.rememberMeCell.accessoryType = .None
            }
        }
        if indexPath.section == 2 {
            self.loginIndicate.startAnimating()
            self.login()
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
    
    func login() {
        // Validate the username & password.
        guard let username = self.userNameCell.inputContent?.text else {
            let userNameMissingAlert: UIAlertView = UIAlertView(title: "Missing Data", message: "Please input your user name.", delegate: nil, cancelButtonTitle: "OK")
            userNameMissingAlert.show()
            return
        }
        guard let password = self.passwordCell.inputContent?.text else {
            let passwordMissingAlert = UIAlertView(title: "Missing Data", message: "Please input your password.", delegate: nil, cancelButtonTitle: "OK")
            passwordMissingAlert.show()
            return
        }
        var rememberMe = false
        if self.rememberMeCell.accessoryType == .Checkmark {
            rememberMe = true
        }
        
        Alamofire.request(.POST, ObiBeautyTeam.APIURL + "/", parameters: [
                "Username": username,
                "Password": password,
                "RememberMe": rememberMe.description
            ]).responseJSON {
                response in
                
                guard let rawData = response.result.value as? [String : AnyObject?] else {
                    UIAlertView(title: "Sign in Failed", message: "Please check your network.", delegate: nil, cancelButtonTitle: "OK").show()
                    return
                }
                
                let data = ObiValue<String>(rawData: rawData)
                // Error Handling
                if data.statusCode != 200 {
                    switch data.statusCode {
                    case 403:
                        UIAlertView(title: "Sign in Failed", message: "The account is locked out or log in failure.", delegate: nil, cancelButtonTitle: "OK").show()
                    case 302:
                        UIAlertView(title: "Sign in Failed", message: "The account Requires Verification.", delegate: nil, cancelButtonTitle: "OK").show()
                    default:
                        UIAlertView(title: "Sign in Failed", message: "\(data.statusCode) Unknown Error.\nThe error will be logged to Obisoft.", delegate: nil, cancelButtonTitle: "OK").show()
                        ObiBeautyTeam.logError("\(data.statusCode) in login")
                    }
                    return
                }
                
                // If login succeed
                // Store Password
                let keychain = KeychainSwift()
                keychain.set(username, forKey: "obiUserName")
                keychain.set(password, forKey: "obiPassword")
                
                self.navigationController?.pushViewController(UIViewController(), animated: true)
                
        }
    }

}
