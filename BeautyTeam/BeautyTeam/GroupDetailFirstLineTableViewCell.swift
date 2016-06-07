//
//  GroupDetailFirstLineTableViewCell.swift
//  BeautyTeam
//
//  Created by Carl Lee on 5/22/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class GroupDetailFirstLineTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel(frame: CGRectMake(22, 22, 166, 23))
    
    var ownerIndicatorLabel = UILabel(frame: CGRectMake(22, 64, 65, 18))
    var ownerButton = UIButton(type: UIButtonType.System)
    
    var adminIndicatorLabel = UILabel(frame: CGRectMake(22, 92, 65, 18))
    var adminButton = UIButton(type: .System)
    
    var groupImageView: UIImageView = UIImageView(frame: CGRectMake(271, 27, 83, 83))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // nameLabel
        self.nameLabel.font = UIFont.systemFontOfSize(20)
        
        // Color 199 199 205
        // owner
        self.ownerIndicatorLabel.text = "Owner"
        self.ownerIndicatorLabel.font = UIFont.systemFontOfSize(18)
        self.ownerIndicatorLabel.textColor = UIColor(red: 199/255, green: 199/255, blue: 205/255, alpha: 1)
        
        self.ownerButton.frame = CGRectMake(87, 64, 100, 18)
        self.ownerButton.titleLabel?.font = UIFont.systemFontOfSize(18)
        self.ownerIndicatorLabel.textColor = UIColor(red: 199/255, green: 199/255, blue: 205/255, alpha: 1)
        
        // admin
        self.adminIndicatorLabel.text = "Admin"
        self.adminIndicatorLabel.font = UIFont.systemFontOfSize(18)
        self.adminIndicatorLabel.textColor = UIColor(red: 199/255, green: 199/255, blue: 205/255, alpha: 1)
        
        self.adminButton.frame = CGRectMake(87, 92, 100, 18)
        self.adminButton.titleLabel?.font = UIFont.systemFontOfSize(18)
        
        // groupImageView
        self.groupImageView.layer.cornerRadius = self.groupImageView.frame.width / 2
        self.groupImageView.layer.masksToBounds = true
        
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(ownerIndicatorLabel)
        self.contentView.addSubview(ownerButton)
        self.contentView.addSubview(adminIndicatorLabel)
        self.contentView.addSubview(adminButton)
        self.contentView.addSubview(groupImageView)
    }
    
    func assignValue(groupName: String, ownerName: String, adminName: String, groupImageURL: NSURL) {
        self.nameLabel.text = groupName
        self.ownerButton.setTitle(ownerName, forState: .Normal)
        self.adminButton.setTitle(adminName, forState: .Normal)
//        self.groupImageView.sd_setImageWithURL(groupImageURL)
        self.groupImageView.sd_setImageWithURL(NSURL(string: "https://obisoft.oss-cn-beijing.aliyuncs.com/WebSiteIcon/Icon.jpg")!)
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
