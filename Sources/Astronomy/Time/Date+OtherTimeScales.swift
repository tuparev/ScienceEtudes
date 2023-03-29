//
//  Date+OtherTimeScales.swift
//  
//
//  Created by Hunter Holland on 3/27/23.
//

import Foundation

public extension Date {
    // MARK: - International Atomic Time (TAI)
    var tai: Date {
        // TODO: Implement TAI-UTC table (Table 3.1) on page 87 of "The Explanatory Supplement to the Astronomical Almanac".
        var utcOffset: TimeInterval
        switch self {
        default:
            utcOffset = 37.0
        }
        
        return self + utcOffset
    }
    
    // MARK: - Terrestrial Time (TT)
    var tt: Date { self.tai + 32.184 }
}
