//
//  TimeSystemTests.swift
//  CoreMathsTests
//
//  Created by Hunter Holland on 27/03/23.
//

import XCTest
import CoreMaths
@testable import Time

final class TimeSystemTests: XCTestCase {
    func testGreenwichMeanSiderealTime() throws {
        let testDate = Date(julianDay: 2446895.5)
        let trueSidereal = Angle("13h10m46.3668s")!
        let sidereal = testDate.siderealTime(.greenwichMean)
        
        XCTAssertEqual(sidereal.degrees, trueSidereal.degrees, accuracy: 1e-6)
    }
    
    func testGreenwichApparentSiderealTime() throws {
        let testDate = Date(julianDay: 2446895.5)
        let trueSidereal = Angle("13h10m46.1351s")!
        let sidereal = testDate.siderealTime(.greenwichApparent)

        XCTAssertEqual(sidereal.degrees, trueSidereal.degrees, accuracy: 1e-6)
    }
}
