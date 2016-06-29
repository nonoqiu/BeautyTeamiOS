//
//  GroupDetailMembersLineTableViewCell.swift
//  BeautyTeam
//
//  Created by Carl Lee on 5/22/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit
import Async
import Alamofire
import Alamofire_Synchronous

class GroupDetailMembersLineTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var members = [GroupUserTableViewModel]()
    
    // Views
    var collectionView: UICollectionView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // collectionView
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.itemSize = CGSize(width: 63, height: 88)
        
        self.collectionView = UICollectionView(frame: CGRectMake(2, 2, UIScreen.mainScreen().bounds.width - 4, 300), collectionViewLayout: collectionLayout)
        self.collectionView?.registerClass(GroupDetailMemberCollectionViewCell.self, forCellWithReuseIdentifier: "groupdetail")
        collectionView?.backgroundColor = UIColor.whiteColor()
        self.contentView.addSubview(collectionView!)
    }
    
    func membersReloadData() {
        if members.isEmpty {
            fatalError("members loading error")
        }
        
        Async.background {
            let group = AsyncGroup()
            let i = 0
            while (i < self.members.count) {
                group.background {
                    self.members[i].fetchNextDataSynchronous()
                }
            }
        }.main {
            self.collectionView?.reloadData()
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
    
    // MARK: - 
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return members.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("groupdetail", forIndexPath: indexPath) as! GroupDetailMemberCollectionViewCell
        let element = members[indexPath.row].user!
        cell.nameLabel.text = element.nickname
        cell.imageView.sd_setImageWithURL(element.iconImageURL)
        
        return cell
    }

}
