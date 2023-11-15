//
//  Date+Epoch.swift
//  swift-astronomy
//
//  Created by Hunter Holland on 2/21/23.
//

import Foundation

public typealias Epoch = Date

public extension Date {
    static let B1950 = Date(julianDay: 2_433_282.4235)
    static let J2000 = Date(julianDay: 2_451_545.0)
    static let J2016 = Date(julianDay: 2_457_389.0)
    
    /// The current date, expressed in the conventional Julian epoch notation.
    ///
    /// For example, if the Julian epoch string would be "J2000.0" for 12:00 UT on January 1, 2000.
    var julianEpoch: String {        
        let comp = DateComponents(year: self.year, month: 1, day: 1, hour: 12)
        let startOfCurrentJulianYear = Calendar.gregorianUTC.date(from: comp)!
        let julianYearProgress = (self.julianDay - startOfCurrentJulianYear.julianDay) / 365.25
        let epoch = Double(self.year) + julianYearProgress
        return "J"+String(epoch)
    }
}
