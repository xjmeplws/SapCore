//
//  SapColor.swift
//  SapCore
//
//  Created by huangyawei on 15/10/10.
//  Copyright © 2015年 sapze. All rights reserved.
//

import Foundation


public extension UIColor {
    
    public func fromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    public func cgColor(rgbValue: UInt) -> CGColorRef {
        return fromRGB(rgbValue).CGColor
    }
}