//
//  NoticeRightNavigationItemPopMenu.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/21/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class NoticeRightNavigationItemPopMenu: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    weak var jumpDelegate: NoticeVC?
    var personalTaskCell: UITableViewCell?
    var personalEventCell: UITableViewCell?
    var importCell: UITableViewCell?

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.personalTaskCell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        self.personalEventCell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        self.importCell = UITableViewCell(style: .Default, reuseIdentifier: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return self.personalTaskCell!
        case 1:
            return self.personalEventCell!
        case 2:
            return self.importCell!
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.deselectRowAtIndexPath(indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            self.jumpDelegate?.navigationController?.pushViewController(AddPersonalTaskVC(style: .Grouped), animated: true)
        case 1:
            self.jumpDelegate?.navigationController?.pushViewController(AddPersonalEventVC(style: .Grouped), animated: true)
        case 2:
            self.jumpDelegate?.navigationController?.pushViewController(ImportVC(style: .Grouped), animated: true)
        default:
            break
        }
    }

}
