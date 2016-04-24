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
