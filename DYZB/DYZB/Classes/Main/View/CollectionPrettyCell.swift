//
//  CollectionPrettyCell.swift
//  DYZB
//
//  Created by michael on 2016/9/26.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionPrettyCell: CollectionBaseCell {

    //MARK:- 控件属性
    @IBOutlet weak var cityBtn: UIButton!
    
    //MARK:- 定义模型属性
    override var anchor : AnchorModel? {
        didSet {
            //1.将属性传递给父类
            super.anchor = anchor

            //3.所在的城市
            cityBtn.setTitle(anchor?.anchor_city, for: .normal)

        }
    }

}
