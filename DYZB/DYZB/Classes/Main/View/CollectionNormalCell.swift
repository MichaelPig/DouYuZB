//
//  CollectionNormalCell.swift
//  DYZB
//
//  Created by michael on 2016/9/25.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {
    
    //MARK:- 控件的属性
    @IBOutlet weak var roomNameLabel: UILabel!
    
    //MARK:- 定义模型属性
    override var anchor : AnchorModel? {
        didSet{
            //1.将属性传递给父类
            super.anchor = anchor
            
            //4.房间名称
            roomNameLabel.text = anchor?.room_name
        }
    }

}
