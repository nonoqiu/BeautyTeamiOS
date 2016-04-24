//
//  RadioStationEventCell.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/24/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit
import FontAwesome_swift

class RadioStationEventCell: UITableViewCell, CustomPresentCellProtocol {
    
    var titleLabel: UILabel?
    var projectImageView: UIImageView?
    var projectLabel: UILabel?
    var timeImageView: UIImageView?
    var timeLabel: UILabel?
    var emergencyLabel: UILabel?
    var locationImageView: UIImageView?
    var locationLabel: UILabel?
    
    required init(reuseIdentifier: String) {
        super.init(style: .Default, reuseIdentifier: reuseIdentifier)
        let fontAwesomeSize = CGSize(width: 12, height: 12)
        
        self.titleLabel = UILabel(frame: CGRectMake(10, 10, 300, 20))
        self.titleLabel?.font = UIFont.systemFontOfSize(20)
        
        // 74 144 226
        self.timeImageView = UIImageView(frame: CGRectMake(10, 70, 12, 12))
        self.timeImageView?.image = UIImage.fontAwesomeIconWithName(.ClockO, textColor: UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1), size: fontAwesomeSize)
        self.timeLabel = UILabel(frame: CGRectMake(30, 70, 300, 12))
        self.timeLabel?.font = UIFont.systemFontOfSize(12)
        
        // 208 2 27
        self.emergencyLabel = UILabel(frame: CGRectMake(310, 70, 100, 12))
        self.emergencyLabel?.font = UIFont.boldSystemFontOfSize(12)
        
        // 0 0 0
        self.locationImageView = UIImageView(frame: CGRectMake(10, 110, 12, 12))
        self.locationImageView?.image = UIImage.fontAwesomeIconWithName(.LocationArrow, textColor: UIColor.blackColor(), size: fontAwesomeSize)
        self.locationLabel = UILabel(frame: CGRectMake(30, 110, 300, 12))
        self.locationLabel?.font = UIFont.systemFontOfSize(12)
    }
    
    func assignValue(title: String, happenTime: NSDate, endTime: NSDate, location: String) {
        self.titleLabel?.text = title
        
        let happenTimeStr = ObiBeautyTeam.ObiDateFormatter().stringFromDate(happenTime)
        let endTimeStr = ObiBeautyTeam.ObiDateFormatter().stringFromDate(endTime)
        // TODO: Solve the problem of presenting the happentime and endtime.
        // like this one:
        // Today 21:00 - 22:00
        // Today 09:00 - Tomorrow 14:00
        // 21:00 - 22:00 April 9
        // Modify this line and the one in `TeanEventCell.swift` after having any idea.
        let combinedTimeStr = "\(happenTimeStr) - \(endTimeStr)"
        
        let combinedAttrStr = NSMutableAttributedString(string: combinedTimeStr)
        combinedAttrStr.setAttributes([NSForegroundColorAttributeName : UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)], range: NSMakeRange(0, combinedTimeStr.characters.count))
        self.timeLabel?.attributedText = combinedAttrStr
        
        self.locationLabel?.text = location
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
