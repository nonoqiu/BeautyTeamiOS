//
//  GroupTableViewCell.swift
//  BeautyTeam
//
//  Created by Carl Lee on 5/10/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    var groupImage: UIImageView?
    var groupNameLabel: UILabel?
    var groupDetailLabel: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.groupImage = UIImageView(frame: CGRectMake(10, 10, 20, 20))
        
        self.groupNameLabel = UILabel(frame: CGRectMake(40, 10, 100, 12))
        self.groupNameLabel?.font = UIFont.systemFontOfSize(12)
        
        self.groupDetailLabel = UILabel(frame: CGRectMake(30, 30, 100, 10))
        self.groupDetailLabel?.textColor = UIColor.grayColor()
        self.groupDetailLabel?.font = UIFont.systemFontOfSize(8)
        
        self.contentView.addSubview(groupImage!)
        self.contentView.addSubview(groupNameLabel!)
        self.contentView.addSubview(groupDetailLabel!)
    }
    
    func assignValue(groupImageURL: NSURL, groupName: String, groupMemberCount: Int) {
        self.groupImage?.sd_setImageWithURL(groupImageURL)
        self.groupNameLabel?.text = groupName
        self.groupDetailLabel?.text = "\(groupMemberCount) People"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
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
