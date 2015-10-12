//
//  SapUIView.swift
//  SapCore
//
//  Created by huangyawei on 15/10/12.
//  Copyright © 2015年 sapze. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {

    ///Set this view a width of percent belong the parent view
    public func setWidthPercent(width: Int) {
        if width >= 0  && width <= 100 {
            if let parentViewWidth = self.superview?.frame.size.width{
                self.frame.size.width = (CGFloat(width) / 100) * parentViewWidth
            }
        }
    }
    ///Set this view a height of percent belong the parent view
    public func setHeightPercent(width: Int) {
        if width >= 0  && width <= 100 {
            if let parentViewWidth = self.superview?.frame.size.height{
                self.frame.size.height = (CGFloat(width) / 100) * parentViewWidth
            }
        }
    }
    ///Set this view align to left. The percent should between 0 and 100. The margin is a platform to the parent view
    public func alignLeft(percent margin: Int) {
        guard let parentViewWidth = self.superview?.frame.size.width else {
            return
        }
        if margin >= 0 && margin <= 100 {
            let left = (CGFloat(margin) / 100) * parentViewWidth
            setFrame(0 + left, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set this view align to left. The margin is a platform to the parent view
    public func alignLeft(margin: CGFloat = 0){
        setFrame(0 + margin, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
    }
    ///Set this view align to right. The percent should between 0 and 100. The margin is a platform to the parent view
    public func alignRight(percent margin: Int) {
        guard let parentViewWidth = self.superview?.frame.size.width else {
            return
        }
        if margin >= 0 && margin <= 100 {
            let left = (CGFloat(margin) / 100) * parentViewWidth
            setFrame(parentViewWidth - self.frame.size.width - left, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set this view align to right. The margin is a platform to the parent view
    public func alignRight(margin: CGFloat = 0){
        if let parentViewWidth = self.superview?.frame.size.width{
            setFrame(parentViewWidth - self.frame.size.width - margin, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set this view align to top. The percent should between 0 and 100. The margin is a platform to the parent view
    public func alignTop(percent margin: Int) {
        guard let parentViewHeight = self.superview?.frame.size.height else {
            return
        }
        if margin >= 0 && margin <= 100 {
            let top = (CGFloat(margin) / 100) * parentViewHeight
            setFrame(self.frame.origin.x, 0 + top, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set this view align to top. The margin is a platform to the parent view
    public func alignTop(margin: CGFloat = 0) {
        setFrame(self.frame.origin.x, 0 + margin, self.frame.size.width, self.frame.size.height)
    }
    ///Set this view align to bottom. The percent should between 0 and 100. The margin is a platform to the parent view
    public func alignBottom(percent margin: Int) {
        guard let parentViewHeight = self.superview?.frame.size.height else {
            return
        }
        if margin >= 0 && margin <= 100 {
            let top = (CGFloat(margin) / 100) * parentViewHeight
            setFrame(self.frame.origin.x, parentViewHeight - self.frame.size.height - top, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set this view align to bottom. The margin is a platform to the parent view
    public func alignBottom(margin: CGFloat = 0) {
        if let parentViewHeight = self.superview?.frame.size.height{
            setFrame(self.frame.origin.x, parentViewHeight - self.frame.size.height - margin, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set this view align to center of it's parent view. The percent should between 0 and 100. The TOP is a margin to top and LEFT is a margin to left
    public func alignCenter(percent top: Int, left: CGFloat) {
        guard let parentViewWidth = self.superview?.frame.size.width else {
            return
        }
        guard let parentViewHeight = self.superview?.frame.size.height else {
            return
        }
        if top >= 0 && top <= 100 && left >= 0 && left <= 100 {
            let top = (CGFloat(top) / 100) * parentViewHeight
            let left = (CGFloat(left) / 100) * parentViewWidth
            setFrame(self.frame.origin.x + left, parentViewHeight - self.frame.size.height - top, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set this view align to center of it's parent view. The TOP is a margin to top and LEFT is a margin to left
    public func alignCenter(top: CGFloat = 0, _ left: CGFloat = 0){
        if let parentWidth = self.superview?.frame.size.width {
            setFrame((parentWidth - self.frame.size.width) / 2 + left, self.frame.origin.y + top, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set this view align to vertical center of it's parent view. The percent should between 0 and 100. The TOP is a margin to top and LEFT is a margin to left
    public func verticalCenter(percent top: Int, left: CGFloat) {
        guard let parentViewWidth = self.superview?.frame.size.width else {
            return
        }
        guard let parentViewHeight = self.superview?.frame.size.height else {
            return
        }
        if top >= 0 && top <= 100 && left >= 0 && left <= 100 {
            let top = (CGFloat(top) / 100) * parentViewHeight
            let left = (CGFloat(left) / 100) * parentViewWidth
            setFrame(self.frame.origin.x + left, (parentViewHeight - self.frame.size.height) / 2 + top, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set this view align to vertical center of it's parent view. The TOP is a margin to top and LEFT is a margin to left
    public func verticalCenter(top: CGFloat = 0, _ left: CGFloat = 0){
        if let parentHeight = self.superview?.frame.size.height {
            setFrame(self.frame.origin.x + left, (parentHeight - self.frame.size.height) / 2 + top, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set a margin of thie view, just set top or left. The percent should between 0 and 100
    public func setMargin(percent top: Int = 0, left: Int = 0) {
        guard let parentViewWidth = self.superview?.frame.size.width else {
            return
        }
        guard let parentViewHeight = self.superview?.frame.size.height else {
            return
        }
        if top >= 0 && top <= 100 && left >= 0 && left <= 100 {
            let top = (CGFloat(top) / 100) * parentViewHeight
            let left = (CGFloat(left) / 100) * parentViewWidth
            setFrame(self.frame.origin.x + left, self.frame.origin.y + top, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set a margin of thie view, just set top or left
    public func setMargin(top: CGFloat = 0, left: CGFloat = 0) {
        setFrame(self.frame.origin.x + left, self.frame.origin.y + top, self.frame.size.width, self.frame.size.height)
    }
    ///Set self to the RIGHT of the tView, the tView should in a same UIView with self. The percent should between 0 and 100
    public func alignLeftToView(percent tView: UIView, _ left: CGFloat = 0) {
        guard let parentViewWidth = self.superview?.frame.size.width else {
            return
        }
        if left >= 0 && left <= 100 {
            let left = (CGFloat(left) / 100) * parentViewWidth
            setFrame(tView.frame.origin.x + tView.frame.size.width + left, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set self to the RIGHT of the tView, the tView should in a same UIView with self
    public func alignLeftToView(tView: UIView, _ left: CGFloat = 0) {
        setFrame(tView.frame.origin.x + tView.frame.size.width + left, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
    }
    ///Set self to the LEFT of the tView, the tView should in a same UIView with self. The percent should between 0 and 100
    public func alignRightToView(percent tView: UIView, _ right: CGFloat = 0) {
        guard let parentViewWidth = self.superview?.frame.size.width else {
            return
        }
        if right >= 0 && right <= 100 {
            let left = (CGFloat(right) / 100) * parentViewWidth
            setFrame(tView.frame.origin.x - self.frame.size.width - left, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set self to the LEFT of the tView, the tView should in a same UIView with self
    public func alignRightToView(tView: UIView, _ right: CGFloat = 0) {
        setFrame(tView.frame.origin.x - self.frame.size.width - right, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
    }
    ///Set self to the TOP of the tView, the tView should in a same UIView with self. The percent should between 0 and 100
    public func alignTopToView(percent tView: UIView, _ top: CGFloat = 0) {
        guard let parentViewHeight = self.superview?.frame.size.height else {
            return
        }
        if top >= 0 && top <= 100 {
            let top = (CGFloat(top) / 100) * parentViewHeight
            setFrame(self.frame.origin.x, tView.frame.origin.y + tView.frame.size.height + top, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set self to the TOP of the tView, the tView should in a same UIView with self
    public func alignTopToView(tView: UIView, _ top: CGFloat = 0) {
        setFrame(self.frame.origin.x, tView.frame.origin.y + tView.frame.size.height + top, self.frame.size.width, self.frame.size.height)
    }
    ///Set self to the BOTTOM of the tView, the tView should in a same UIView with self. The percent should between 0 and 100
    public func alignBottomToView(percent tView: UIView, _ bottom: CGFloat = 0) {
        guard let parentViewHeight = self.superview?.frame.size.height else {
            return
        }
        if bottom >= 0 && bottom <= 100 {
            let bottom = (CGFloat(bottom) / 100) * parentViewHeight
            setFrame(self.frame.origin.x, tView.frame.origin.y - self.frame.size.height - bottom, self.frame.size.width, self.frame.size.height)
        }
    }
    ///Set self to the BOTTOM of the tView, the tView should in a same UIView with self
    public func alignBottomToView(tView: UIView, _ bottom: CGFloat = 0) {
        setFrame(self.frame.origin.x, tView.frame.origin.y - self.frame.size.height - bottom, self.frame.size.width, self.frame.size.height)
    }
    
    
    public func setFrame(x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.frame = CGRectMake(x, y, width, height)
    }
}
