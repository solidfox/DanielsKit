//
//  DateStuff.swift
//  DanielsKit
//
//  Created by Daniel Schlaug on 7/14/14.
//  Copyright (c) 2014 Daniel Schlaug. All rights reserved.
//

import Foundation

func -(lhs:NSDate, rhs:NSDate) -> DateRange {
    return DateRange(startDate: rhs, endDate: lhs)
}

class DateRange {
    let startDate:NSDate
    let endDate:NSDate
    var calendar = NSCalendar.currentCalendar()
    var days: Int {
        return calendar.components(.Day, fromDate: startDate, toDate: endDate, options: []).day
    }
    var months: Int {
        return calendar.components(.Month, fromDate: startDate, toDate: endDate, options: []).month
    }
    init(startDate:NSDate, endDate:NSDate) {
        self.startDate = startDate
        self.endDate = endDate
    }
}