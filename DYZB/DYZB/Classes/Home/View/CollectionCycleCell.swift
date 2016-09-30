//
//  CollectionCycleCell.swift
//  DYZB
//
//  Created by michael on 2016/9/30.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionCycleCell: UICollectionViewCell {

    //MSRK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK:- 定义模型属性
    var cycleModel : CycleModel? {
        didSet {
            titleLabel.text = cycleModel?.title
            let iconUrl = URL(string: cycleModel?.pic_url ?? "")
            iconImageView.kf.setImage(with: iconUrl, placeholder: UIImage(named: "Img_default"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}
