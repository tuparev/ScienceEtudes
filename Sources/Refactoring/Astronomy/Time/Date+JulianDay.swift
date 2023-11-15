//
//  Date+JulianDay.swift
//  
//
//  Created by Hunter William Holland on 17.03.2023.
//  Copyright © See Framework's LICENSE file
//
// Many of the algorithms in this Date extension are based on
//   Astronomical Algorithms (second edition)
//   Author: Jean Meeus
//   Published by Willmann-Bell, Inc. Copyright © 1991, 1998, 2005
//

import Foundation

public extension Date {
    /// Creates a new ``Date`` from a `JulianDay`
    ///
    /// - Parameter julianDay: should be a positive ``Double``
    @inlinable init(julianDay: Double) {
        precondition(julianDay >= 0, "Julian Dates must be positive.")

        let epochSeconds = round((julianDay - 2_440_587.5) * 86400)

        self.init(timeIntervalSince1970: epochSeconds)
    }

    /// The date's Julian Day (JD), expressed as a decimal number of days since the beginning of the current Julian Period.
    ///
    /// The current Julian Period began at noon on the first day of the year -4712 (4713 BCE) in the Julian calendar, making
    /// the year 2000 year 6713 of the current Julian Period.
    @inlinable var julianDay: Double {
        var Y = Double(self.year)
        var M = Double(self.month)
        let D = Double(self.day) + self.dayFraction

        if M == 1 || M == 2 { Y -= 1; M += 12 }

        let A = floor(Y / 100)
        let B = 2 - A + floor(A / 4)

        let JD = floor(365.25*(Y+4716) + floor(30.6001*(M+1))) + D + B - 1524.5

        return JD
    }
    
    /// The date's Julian Day (JD), expressed as a decimal number of days since the beginning of the current Julian Period.
    ///
    /// This is a convenience method that accesses the same value as ``julianDay``.
    @inlinable var jd: Double { self.julianDay }

    /// The date's Modified Julian Day (MJD).
    ///
    /// The epoch of the MJD system is at midnight on November 17, 1858. That is, the MJD of 1858-11-17 00:00:00 is 0.0.
    @inlinable var modifiedJulianDay: Double { self.julianDay - 2_400_000.5 }
    
    /// The date's Modified Julian Day (MJD).
    ///
    /// This is a convenience method that accesses the same value as ``modifiedJulianDay``.
    @inlinable var mjd: Double { self.modifiedJulianDay }
}
