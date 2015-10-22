//
//  SapDate.swift
//  SapCore
//
//  Created by huangyawei on 15/10/9.
//  Copyright © 2015年 sapze. All rights reserved.
//
import Foundation

enum NSDateError: ErrorType {
    case FormatError
    case ReadError
}


let DEFAULT_FORMAT = "yyyy-MM-dd HH:mm:ss"

public extension String {
    //transfer
    public func dateFromDouble(dateValue: Double) -> NSDate {
        return NSDate(timeIntervalSince1970: dateValue)
    }
    
    public func dateFromString(format: String = DEFAULT_FORMAT) -> NSDate {
        do {
            return try doTransfer(self, format)
        } catch let error as NSDateError {
            print("Transfer error:\(error)")
        }catch let error as NSError {
            print("Default error:\(error)")
        }
        return NSDate()
    }
    private func doTransfer(dateString: String,_ format: String) throws -> NSDate {
        //if date format is not right
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = format
        guard let d = dateFormat.dateFromString(dateString) else {
            throw NSDateError.FormatError
        }
        //if not date
        //throw NSDateError.ReadError
        return d
    }
}

//operation
public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSince1970 == rhs.timeIntervalSince1970
}
public func <=(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSince1970 <= rhs.timeIntervalSince1970
}
public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSince1970 < rhs.timeIntervalSince1970
}
public func >=(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSince1970 >= rhs.timeIntervalSince1970
}
public func >(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSince1970 > rhs.timeIntervalSince1970
}
public func +(lhs: NSDate, rhs: NSTimeInterval) -> NSDate {
    return NSDate(timeInterval: rhs, sinceDate: lhs)
}
public func -(lhs: NSDate, rhs: NSTimeInterval) -> NSDate {
    return NSDate(timeInterval: -rhs, sinceDate: lhs)
}

public extension NSDate {
    //transfer
    public func stringFromDate(format: String = DEFAULT_FORMAT) -> String {
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.stringFromDate(self)
    }
    //compare date
    public func add(year: Double = 0, day: Double = 0, hour: Double = 0, minute: Double = 0) -> NSDate {
        let _year = year * 365 * 24 * 60 * 60
        let _day = (day + 1) * 24 * 60 * 60
        let _hour = hour * 60 * 60
        let _minute = minute * 60
        let ti: NSTimeInterval = _year + _day + _hour + _minute
        return self.dateByAddingTimeInterval(ti)
    }
    public func between(after: NSDate, _ before: NSDate) -> Bool {
        return (self.compare(after) == NSComparisonResult.OrderedDescending && self.compare(before) == NSComparisonResult.OrderedAscending)
    }
    
    public func isEqualDate(date: NSDate) -> Bool {
        return self.compare(date) == NSComparisonResult.OrderedSame
    }
    
    public func isBeforeDate(date: NSDate) -> Bool {
        return self.compare(date) == NSComparisonResult.OrderedAscending
    }
    
    public func isAfterDate(date: NSDate) -> Bool {
        return self.compare(date) == NSComparisonResult.OrderedDescending
    }
    
    //date components detail
    public var components: NSDateComponents {
        let calendar = NSCalendar.currentCalendar()
        let unitFlag: NSCalendarUnit = [.Year, .Month, .Day, .Weekday, .Hour, .Minute, .Second]
        return calendar.components(unitFlag, fromDate: self)
    }
    
    public var year: Int {
        return components.year
    }
    public var month: Int {
        return components.month
    }
    public var day: Int {
        return components.day
    }
    public var week: Int {
        return components.weekday
    }
    public var hour: Int {
        return components.hour
    }
    public var minute: Int {
        return components.minute
    }
    public var second: Int {
        return components.second
    }
}