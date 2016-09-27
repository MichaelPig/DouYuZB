//
//  RecommendViewModel.swift
//  DYZB
//
//  Created by michael on 2016/9/27.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class RecommendViewModel {
    //MARK:- 懒加载属性
    public lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
}

//MARK:- 发送网络请求
extension RecommendViewModel {
    func requestData() {
        //1.请求第一部分推荐数据
        
        //2.请求第二部分推荐数据
        
        //3.请求后面部分游戏数据
        
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: ["limit" : "4", "offset" : "0", "time" : NSDate.getCurrentTime() as NSString]) { (result) in
            
            //1.将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else{
                return
            }

            //2.根据data该key，获取数据
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else{
                return
            }
            //3.遍历数组，获取字典，并且将字典转成模型对象
            for dict in dataArray{
                let group = AnchorGroup(dict: dict)
                self.anchorGroups.append(group)
            }
            
            for group in self.anchorGroups{
                for anchor in group.anchors{
                    print(anchor.nickname)
                }
                print("----")
            }
        }
    }
}
