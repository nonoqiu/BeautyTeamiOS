//
//  CollapseSign.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/24/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

enum CollapseSignStatus {
    case Expanded
    case Collapsed
}

class CollapseSign: UIImageView {
    // x: 15 y: 6
    
    var status: CollapseSignStatus?
    
    init(x: CGFloat, y: CGFloat) {
        super.init(frame: CGRectMake(x, y, 15, 8))
    }
    
    func changeStatus() {
        if self.status == .Expanded /* origin up */ {
            self.image = UIImage(named: "CollapseSign-Down")
            self.status = .Collapsed
        } else if self.status == .Collapsed {
            self.image = UIImage(named: "CollapseSign-Up")
            self.status = .Expanded
        }
    }
    
    func collapse() {
        self.image = UIImage(named: "CollapseSign-Down")
        self.status = .Collapsed
    }
    
    func expand() {
        self.image = UIImage(named: "CollapseSign-Up")
        self.status = .Expanded
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
