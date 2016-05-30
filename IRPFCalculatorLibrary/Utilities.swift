//
//  Utilities.swift
//  IRPFCalculatorLibrary
//
//  Created by Álvaro Frutos on 18/12/14.
//  Copyright (c) 2014 Álvaro Frutos. All rights reserved.
//

// MARK: - General functions

import UIKit

func yearFromDate(date: NSDate) -> Int {
    let calendar = NSCalendar.currentCalendar()
    let components = calendar.components(NSCalendarUnit.Year, fromDate: date)
    return components.year
}

func dateWithComponents(year: Int, month: Int, day: Int) -> NSDate {
    
    let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
    
    let components = NSDateComponents()
    
    components.year  = year
    components.month = month
    components.day   = day
    
    if let date = calendar!.dateFromComponents(components) {
        return date
    } else {
        return NSDate()
    }
}

func initBirthDate() -> NSDate {
    return dateWithComponents(1985, month: 1, day: 1)
}
