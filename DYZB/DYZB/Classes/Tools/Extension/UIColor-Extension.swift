//
//  UIColor-Extension.swift
//  DYZB
//
//  Created by michael on 2016/9/22.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
}

