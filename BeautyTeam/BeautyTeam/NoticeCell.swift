//
//  NoticeCell.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/22/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit
import FontAwesome_swift

class NoticeCell: UITableViewCell {
    
    var titleLabel: UILabel?
    var projectImageView: UIImageView?
    var projectLabel: UILabel?
    var timeImageView: UIImageView?
    var timeLabel: UILabel?
    var emergencyTimeLabel: UILabel?
    var locationImageView: UIImageView?
    var locationLabel: UILabel?
    
    init(reuseIdentifier: String) {
        super.init(style: .Default, reuseIdentifier: reuseIdentifier)
        
        let fontAwesomeCGSize = CGSize(width: 12, height: 12)
        
        self.titleLabel = UILabel(frame: CGRectMake(10, 10, 200, 20))
        self.titleLabel?.font = UIFont.systemFontOfSize(12)
        
        self.projectImageView = UIImageView(frame: CGRectMake(10, 40, 12, 12))
        self.projectImageView?.image = UIImage.fontAwesomeIconWithName(.Tag, textColor: UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1), size: fontAwesomeCGSize)
        
        self.projectLabel = UILabel(frame: CGRectMake(40, 40, 300, 12))
        self.projectLabel?.font = UIFont.systemFontOfSize(10)
        
        self.timeImageView = UIImageView(frame: CGRectMake(10, 60, 12, 12))
        self.timeImageView?.image = UIImage.fontAwesomeIconWithName(.ClockO, textColor: UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1), size: fontAwesomeCGSize)
        
        self.timeLabel = UILabel(frame: CGRectMake(10, 60, 200, 12))
        self.timeLabel?.font = UIFont.systemFontOfSize(10)
        
        self.emergencyTimeLabel = UILabel(frame: CGRectMake(10, 320, 100, 12))
        self.emergencyTimeLabel?.font = UIFont.systemFontOfSize(10)
        
        self.locationImageView = UIImageView(frame: CGRectMake(10, 80, 12, 12))
        self.locationImageView?.image = UIImage.fontAwesomeIconWithName(.LocationArrow, textColor: UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1), size: fontAwesomeCGSize)
        
        self.locationLabel = UILabel(frame: CGRectMake(10, 80, 300, 12))
        self.locationLabel?.font = UIFont.systemFontOfSize(10)
    }
    
    func assignValue(title: String, project: String?, time: NSDate, location: String) {
        self.titleLabel?.text = title
        
        if (project != nil) {
            let projectAttributedStr = NSMutableAttributedString(string: project!)
            projectAttributedStr.setAttributes([
                NSForegroundColorAttributeName: UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1)
                ], range: NSMakeRange(0, (project?.characters.count)!))
            self.projectLabel?.attributedText = projectAttributedStr
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
