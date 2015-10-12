//
//  SapUIButton.swift
//  SapCore
//
//  Created by huangyawei on 15/10/9.
//  Copyright © 2015年 sapze. All rights reserved.
//

import UIKit

public extension UIButton {
    //title
    public func setTitles(normal: String?, highlighted: String?, disabled: String?, selected: String?, application: String?, reserved: String?){
        if let n = normal {
            self.setTitle(n, forState: .Normal)
        }
        if let h = highlighted {
            self.setTitle(h, forState: .Highlighted)
        }
        if let d = disabled {
            self.setTitle(d, forState: .Disabled)
        }
        if let s = selected {
            self.setTitle(s, forState: .Selected)
        }
        if let a = application {
            self.setTitle(a, forState: .Application)
        }
        if let r = reserved {
            self.setTitle(r, forState: .Reserved)
        }
    }
    //background image
    public func setBackgroundImageByString(normal: String?, highlighted: String?, disabled: String?, selected: String?, application: String?, reserved: String?){
        let n = normal == nil ? nil : UIImage(named: normal!)
        let h = highlighted == nil ? nil : UIImage(named: highlighted!)
        let d = disabled == nil ? nil : UIImage(named: disabled!)
        let s = selected == nil ? nil : UIImage(named: selected!)
        let a = application == nil ? nil : UIImage(named: application!)
        let r = reserved == nil ? nil : UIImage(named: reserved!)
        setBackgroundImageByUIImage(n, highlighted: h, disabled: d, selected: s, application: a, reserved: r)
    }
    public func setBackgroundImageByUIImage(normal: UIImage?, highlighted: UIImage?, disabled: UIImage?, selected: UIImage?, application: UIImage?, reserved: UIImage?){
        if let n = normal {
            self.setBackgroundImage(n, forState: .Normal)
        }
        if let h = highlighted {
            self.setBackgroundImage(h, forState: .Highlighted)
        }
        if let d = disabled {
            self.setBackgroundImage(d, forState: .Disabled)
        }
        if let s = selected {
            self.setBackgroundImage(s, forState: .Selected)
        }
        if let a = application {
            self.setBackgroundImage(a, forState: .Application)
        }
        if let r = reserved {
            self.setBackgroundImage(r, forState: .Reserved)
        }
    }
    //background color
    public func setBackgroundColorByValue(rgbValue: UInt){
        self.titleLabel?.frame = self.frame
        self.backgroundColor = UIColor().fromRGB(rgbValue)
    }
}