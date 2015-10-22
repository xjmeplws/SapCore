//
//  SapUITextField.swift
//  SapCore
//
//  Created by huangyawei on 15/10/9.
//  Copyright © 2015年 sapze. All rights reserved.
//

import UIKit

public extension UITextField{
    func validate(RegEx: String, text: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", RegEx)
        return predicate.evaluateWithObject(text)
    }
    
    public var isEmpty: Bool {
        return self.text == ""
    }
    
    public func validate(RegEx: String) -> Bool {
        return validate(RegEx, text: self.text!)
    }
    
    public var isEmail: Bool {
        return self.validate("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}")
    }
    
    public var isNumber: Bool {
        return self.validate("^[0-9]*$")
    }
    
    public var length: Int {
        return self.text!.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
    }
}