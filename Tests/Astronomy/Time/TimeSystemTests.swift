//
//  TimeSystemTests.swift
//  CoreMathsTests
//
//  Created by Hunter Holland on 27/03/23.
//

import XCTest
import CoreMaths
@testable import Astronomy

final class TimeSystemTests: XCTestCase {
    func testGreenwichMeanSiderealTime() throws {
        let testDate = Date(julianDay: 2446895.5)
        let trueSidereal = Angle("13h10m46.3668s")!
        let sidereal = testDate.siderealTime(.greenwichMean)
        
        XCTAssertEqual(sidereal.arcseconds, trueSidereal.arcseconds, accuracy: 1e-3)
    }
    
    func testGreenwichApparentSiderealTime() throws {
        let testDate = Date(julianDay: 2446895.5)
        let trueSidereal = Angle("13h10m46.1351s")!
        let sidereal = testDate.siderealTime(.greenwichApparent)

        XCTAssertEqual(sidereal.arcseconds, trueSidereal.arcseconds, accuracy: 1e-3)
    }
}
