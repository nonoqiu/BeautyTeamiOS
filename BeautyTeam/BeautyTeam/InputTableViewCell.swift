//
//  InputTableViewCell.swift
//  BeautyTeam
//
//  Created by Carl Lee on 4/20/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit

class InputTableViewCell: UITableViewCell {
    var inputName: UILabel?
    var inputContent: UITextField?
    
    init(name: String, isPassword: Bool = false, reuseIdentifier: String) {
        super.init(style: .Value2, reuseIdentifier: reuseIdentifier)
        self.inputName = UILabel(frame: CGRectMake(10, 11, 90, 20))
        self.inputName?.text = name
        
        self.inputContent = UITextField(frame: CGRectMake(100, 12, 300, 20))
        self.inputContent?.secureTextEntry = isPassword
        self.inputContent?.textColor = UIColor.grayColor()
        
        self.contentView.addSubview(self.inputName!)
        self.contentView.addSubview(self.inputContent!)
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
