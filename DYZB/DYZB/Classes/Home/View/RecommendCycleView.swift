//
//  RecommendCycleView.swift
//  DYZB
//
//  Created by michael on 2016/9/29.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

private let kCycleCellID = "kCycleCellID"

class RecommendCycleView: UIView {
    
    //MARK:- 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = UIViewAutoresizing(rawValue: UInt(0))
        
        //注册Cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCycleCellID)
        
    }
    
    override func layoutSubviews() {
        //设置collectionView的layout
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
    }
    
}

//MARK:- 提供一个快速创建View的类方法
extension RecommendCycleView {
    class func recommendCycleView() -> RecommendCycleView{
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}

//MAKR:- 遵守UICollectionView的数据源协议
extension RecommendCycleView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath)
        
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.red : UIColor.blue
        
        return cell
    }
}


