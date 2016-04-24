//
//  NoticeHeaderCell.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/24/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class NoticeHeaderCell: UITableViewCell, CustomPresentCellProtocol {
    
    var headerColorRectangle: UIView?
    var headerImage: UIImageView?
    var headerTitle: UILabel?
    var collapseSign: CollapseSign?
    static var height: CGFloat = 20
    
    required init(reuseIdentifier: String) {
        super.init(style: .Default, reuseIdentifier: reuseIdentifier)
        
        self.headerColorRectangle = UIView(frame: CGRectMake(0, 0, 10, 20))
        
        self.headerImage = UIImageView(frame: CGRectMake(12, 2, 16, 16))
        
        self.headerTitle = UILabel(frame: CGRectMake(30, 2, 200, 16))
        self.headerTitle?.font = UIFont.boldSystemFontOfSize(15)
        
        self.collapseSign = CollapseSign(x: ObiBeautyTeam.deviceWidth - 17, y: 6)
        self.collapseSign?.collapse()
        self.accessoryView = self.collapseSign
        
        self.contentView.addSubview(headerColorRectangle!)
        self.contentView.addSubview(headerImage!)
        self.contentView.addSubview(headerTitle!)
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
