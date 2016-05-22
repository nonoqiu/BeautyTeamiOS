//
//  GroupDetailMemberCollectionViewCell.swift
//  BeautyTeam
//
//  Created by Carl Lee on 5/22/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class GroupDetailMemberCollectionViewCell: UICollectionViewCell {
    
    var imageView = UIImageView(frame: CGRectMake(0, 0, 63, 63))
    var nameLabel = UILabel(frame: CGRectMake(2, 70, 61, 18))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView.layer.cornerRadius = self.imageView.frame.width / 2
        self.imageView.layer.masksToBounds = true
        
        self.nameLabel.font = UIFont.systemFontOfSize(16)
        
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
