//
//  SapUIViewController.swift
//  SapCore
//
//  Created by huangyawei on 15/10/13.
//  Copyright © 2015年 sapze. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    public func removeNotificationObserver(observer: AnyObject){
        NSNotificationCenter.defaultCenter().removeObserver(observer)
    }
    public func removeNotificationObserver(observer: AnyObject, name: String?, object: AnyObject?){
        NSNotificationCenter.defaultCenter().removeObserver(observer, name: name, object: object)
    }
    public func removeNotificationObserver(observer: NSObject, forKeyPath: String){
        NSNotificationCenter.defaultCenter().removeObserver(observer, forKeyPath: forKeyPath)
    }
    public func removeNotificationObserver(observer: NSObject, forKeyPath: String, context: UnsafeMutablePointer<Void>){
        NSNotificationCenter.defaultCenter().removeObserver(observer, forKeyPath: forKeyPath, context: context)
    }
    //
    public func addNotificationObserver(observer: AnyObject, selector: Selector, name: String?, object: AnyObject?){
        NSNotificationCenter.defaultCenter().addObserver(observer, selector: selector, name: name, object: object)
    }
    public func addNotificationObserver(observer: NSObject, forKeyPath: String, options: NSKeyValueObservingOptions, context: UnsafeMutablePointer<Void>){
        NSNotificationCenter.defaultCenter().addObserver(observer, forKeyPath: forKeyPath, options: options, context: context)
    }
    public func addNotificationObserverForName(name: String?, object: AnyObject?, queue: NSOperationQueue?, usingBlock: (NSNotification) -> Void){
        NSNotificationCenter.defaultCenter().addObserverForName(name, object: object, queue: queue, usingBlock: usingBlock)
    }
    //
    public func postNotification(notification: NSNotification){
        NSNotificationCenter.defaultCenter().postNotification(notification)
    }
    public func postNotificationName(aName: String, object: AnyObject?){
        NSNotificationCenter.defaultCenter().postNotificationName(aName, object: object)
    }
    public func postNotificationName(aName: String, object: AnyObject?, userInfo: [NSObject : AnyObject]?){
        NSNotificationCenter.defaultCenter().postNotificationName(aName, object: object, userInfo: userInfo)
    }
}