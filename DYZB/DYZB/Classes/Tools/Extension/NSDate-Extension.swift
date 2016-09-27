//
//  NSDate-Extension.swift
//  DYZB
//
//  Created by michael on 2016/9/27.
//  Copyright © 2016年 Michael. All rights reserved.
//

import Foundation

extension NSDate {
    class func getCurrentTime() -> String{
        let nowDate = NSDate()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}
