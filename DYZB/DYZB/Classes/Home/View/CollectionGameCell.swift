//
//  CollectionGameCell.swift
//  DYZB
//
//  Created by michael on 2016/10/1.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {
    
    //MARK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK:- 定义模型属性
    var group : AnchorGroup? {
        didSet {
            titleLabel.text = group?.tag_name
            let iconUrl = URL(string: group?.icon_url ?? "")
            iconImageView.kf.setImage(with: iconUrl, placeholder: UIImage(named:"home_more_btn"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }

}
