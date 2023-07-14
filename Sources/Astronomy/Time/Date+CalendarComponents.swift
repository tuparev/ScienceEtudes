//
//  Date+GeneralExtensions.swift
//  swift-astronomy
//
//  Created by Hunter Holland on 2/21/23.
//

import Foundation

public extension Date {
    /// A boolean indicating whether or not the date occurs in a leap year.
    var isInLeapYear : Bool { (year % 100) == 0 ? (year % 400) == 0 : (year % 4) == 0 }
    
    // MARK: - Date Components
    /// The year component of the date, in UTC.
    var year: Int {
        let era = Calendar.gregorianUTC.component(.era, from: self)
        let year = Calendar.gregorianUTC.component(.year, from: self)
        
        return era == 1 ? year : -year
    }
    
    /// The month component of the date, in UTC.
    var month: Int { Calendar.gregorianUTC.component(.month, from: self) }
    
    /// The day component of the date, in UTC.
    var day: Int { Calendar.gregorianUTC.component(.day, from: self) }
    
    /// The hour component of the date, in UTC.
    var hour: Int { Calendar.gregorianUTC.component(.hour, from: self) }
    
    /// The minute component of the date, in UTC.
    var minute: Int { Calendar.gregorianUTC.component(.minute, from: self) }
    
    /// The second component of the date, in UTC.
    var second: Int { Calendar.gregorianUTC.component(.second, from: self) }
    
    /// The nanosecond component of the date, in UTC.
    var nanosecond: Int { Calendar.gregorianUTC.component(.nanosecond, from: self) }
    
    /// The fraction of the current hour that has elapsed.
    var hourFraction: Double { Double(minute)/60 + Double(second)/3600 + Double(nanosecond)/1e9/3600 }
    
    /// The fraction of the current day that has elapsed.
    var dayFraction: Double { (Double(hour) + hourFraction) / 24 }
    
    /// The date's year (in the Gregorian calendar) and fraction of progress therethrough.
    var fractionalYear: Double {
        let daysInYear = (self.isInLeapYear) ? 366.0 : 365.0
        let components = DateComponents(year: self.year, month: 1, day: 1, hour: 0, minute: 0, second: 0)
        let januaryFirst = Calendar.gregorianUTC.date(from: components)!
        return Double(self.year) + ((self.julianDay - januaryFirst.julianDay) / daysInYear)
    }
}

public extension Calendar {
    /// The Gregorian calendar, with times in UTC.
    static let gregorianUTC: Calendar = {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar
    }()
}
