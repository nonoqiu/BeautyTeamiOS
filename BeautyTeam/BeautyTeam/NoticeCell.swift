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
    
    init(title: String, project: String?, time: NSDate, location: String, reuseIdentifier: String) {
        super.init(style: .Default, reuseIdentifier: reuseIdentifier)
        
        self.titleLabel = UILabel(frame: CGRectMake(10, 10, 200, 20))
        self.titleLabel?.text = title
        self.titleLabel?.font = UIFont.systemFontOfSize(12)
        
        self.projectImageView = UIImageView(frame: CGRectMake(10, 40, 12, 12))
        self.projectImageView?.image = UIImage.fontAwesomeIconWithName(.Tag, textColor: UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1), size: CGSize(width: 12, height: 12))
        
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
