//
//  RecommendGameView.swift
//  DYZB
//
//  Created by michael on 2016/10/1.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

private let kGameCellID = "kGameCellID"
private let kEdgeInsetMargin : CGFloat = 10

class RecommendGameView: UIView {
    
    //MSRK:- 定义数组的属性
    var groups : [AnchorGroup]? {
        didSet {
            //1.移除前两组数据
            groups?.removeFirst()
            groups?.removeFirst()
            
            //2.添加更多组
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups?.append(moreGroup)
            
            //3.刷新表格
            collectionView.reloadData()
        }
    }
    
    //MARK:- 空间属性
    @IBOutlet weak var collectionView: UICollectionView!
    
    //系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //让空间不随着父控件的拉伸而拉伸
        autoresizingMask = UIViewAutoresizing.init(rawValue: 0)
        
        //注册Cell
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        
        //给collectionView添加内边距
        collectionView.contentInset = UIEdgeInsets(top: 0, left: kEdgeInsetMargin, bottom: 0, right: kEdgeInsetMargin)
    }
    

}

//MARK:- 提供快速创建的类方法
extension RecommendGameView {
    class func recommendGameView() ->  RecommendGameView {
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}

//MARK:- 遵守UIColletionView的数据源协议
extension RecommendGameView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        
        cell.group = groups![indexPath.item]
        
        return cell
    }
}
