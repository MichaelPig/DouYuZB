//
//  RecommendGameView.swift
//  DYZB
//
//  Created by michael on 2016/10/1.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

private let kGameCellID = "kGameCellID"

class RecommendGameView: UIView {
    
    //MARK:- 空间属性
    @IBOutlet weak var collectionView: UICollectionView!
    
    //系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //让空间不随着父控件的拉伸而拉伸
        autoresizingMask = UIViewAutoresizing.init(rawValue: 0)
        
        //注册Cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kGameCellID)
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
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath)
        
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.red : UIColor.blue
        
        return cell
    }
}
