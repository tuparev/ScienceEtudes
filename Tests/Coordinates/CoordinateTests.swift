//
//  CoordinateTests.swift
//  Coordinates-Tests
//
//  Created by Hunter Holland on 2/22/23.
//

import XCTest
@testable import Time
@testable import CoreMaths
@testable import Coordinates

final class CoordinateTests: XCTestCase {
    
    func testEquatorialToHorizontal() throws {
        let components = DateComponents(year: 1472, month: 8, day: 18, hour: 16, minute: 47, second: 23)
        let date = Calendar.gregorianUTC.date(from: components)!
        
        let lat = Angle(degrees: 77.2069702520977, type: .latitude)
        let lon = Angle(degrees: 118.639627806683, type: .longitude)
        let location = GeographicCoordinate(latitude: lat.degrees, longitude: lon.degrees)
        
        let α = Angle(hour: 9.9129372, type: .longitude)
        let δ = Angle(degrees: 156.304108, type: .latitude)
        let coordinate = EquatorialCoordinate(rightAscension: α, declination: δ)
        
        let converted = coordinate.convertToHorizontal(for: location, at: date)
        
        let trueAlt = Angle("+27d22m50.80s", type: .latitude)!
        let trueAz = Angle("+76d17m21.67s", type: .longitude)!
        
        XCTAssertEqual(converted.altitude, trueAlt)
        XCTAssertEqual(converted.azimuth, trueAz)
    }
    
//    func testDateFromJulianDate() throws {
//        let components = DateComponents(year: 333, month: 1, day: 27, hour: 12, minute: 0, second: 0, nanosecond: 0)
//        let someDate = Calendar.gregorianUTC.date(from: components)!
//        let sameDate = Date(julianDay: 1842713.0)
//        
//        XCTAssertEqual(someDate, sameDate)
//    }
//    
//    //    func testPerformanceExample() throws {
//    //        // This is an example of a performance test case.
//    //        self.measure {
//    //            // Put the code you want to measure the time of here.
//    //        }
//    //    }
    
}
