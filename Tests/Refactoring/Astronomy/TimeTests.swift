//
//  TimeTests.swift
//  CoreMathsTests
//
//  Created by Hunter Holland on 27/03/23.
//

import XCTest
import CoreMaths
@testable import Astronomy

final class TimeTests: XCTestCase {
    // MARK: - Julian Day
    func testJulianDayFromDate() throws {
        var components = DateComponents(calendar: .gregorianUTC, era: 1, year: 2000, month: 1, day: 1, hour: 12)
        let date1 = components.date!
        components = DateComponents(calendar: .gregorianUTC, era: 1, year: 1999, month: 1, day: 1, hour: 0)
        let date2 = components.date!
        components = DateComponents(calendar: .gregorianUTC, era: 1, year: 1987, month: 6, day: 19, hour: 12)
        let date3 = components.date!
        components = DateComponents(calendar: .gregorianUTC, era: 1, year: 1600, month: 12, day: 31, hour: 0)
        let date4 = components.date!
        components = DateComponents(calendar: .gregorianUTC, era: 1, year: 333, month: 1, day: 28, hour: 12)
        let date5 = components.date!
        components = DateComponents(calendar: .gregorianUTC, era: 0, year: 1000, month: 7, day: 3, hour: 12)
        let date6 = components.date!
        components = DateComponents(calendar: .gregorianUTC, era: 0, year: 1000, month: 2, day: 19, hour: 0)
        let date7 = components.date!
        components = DateComponents(calendar: .gregorianUTC, era: 0, year: 4713, month: 11, day: 24, hour: 12)
        let date8 = components.date!
        
        XCTAssertEqual(date1.mjd, 51544.5)
        XCTAssertEqual(date2.jd, 2451179.5)
        XCTAssertEqual(date3.jd, 2446966.0)
        XCTAssertEqual(date4.jd, 2305812.5)
        XCTAssertEqual(date5.jd, 1842713.0)
        XCTAssertEqual(date6.jd, 1356001.0)
        XCTAssertEqual(date7.jd, 1355866.5)
        XCTAssertEqual(date8.jd, 0000000.0)
    }
    
    func testJulianDayToDate() throws {
        let jd1 = 2451545.0
        let jd2 = 2451179.5
        let jd3 = 2446966.0
        let jd4 = 2305812.5
        let jd5 = 1842713.0
        let jd6 = 1356001.0
        let jd7 = 1355866.5
        let jd8 = 0000000.0
        
        var components = DateComponents(calendar: .gregorianUTC, era: 1, year: 2000, month: 1, day: 1, hour: 12)
        let trueDate1 = components.date!
        components = DateComponents(calendar: .gregorianUTC, era: 1, year: 1999, month: 1, day: 1, hour: 0)
        let trueDate2 = components.date!
        components = DateComponents(calendar: .gregorianUTC, era: 1, year: 1987, month: 6, day: 19, hour: 12)
        let trueDate3 = components.date!
        components = DateComponents(calendar: .gregorianUTC, era: 1, year: 1600, month: 12, day: 31, hour: 0)
        let trueDate4 = components.date!
        components = DateComponents(calendar: .gregorianUTC, era: 1, year: 333, month: 1, day: 28, hour: 12)
        let trueDate5 = components.date!
        components = DateComponents(calendar: .gregorianUTC, era: 0, year: 1000, month: 7, day: 3, hour: 12)
        let trueDate6 = components.date!
        components = DateComponents(calendar: .gregorianUTC, era: 0, year: 1000, month: 2, day: 19, hour: 0)
        let trueDate7 = components.date!
        components = DateComponents(calendar: .gregorianUTC, era: 0, year: 4713, month: 11, day: 24, hour: 12)
        let trueDate8 = components.date!
        
        let date1 = Date(julianDay: jd1)
        let date2 = Date(julianDay: jd2)
        let date3 = Date(julianDay: jd3)
        let date4 = Date(julianDay: jd4)
        let date5 = Date(julianDay: jd5)
        let date6 = Date(julianDay: jd6)
        let date7 = Date(julianDay: jd7)
        let date8 = Date(julianDay: jd8)
        
        XCTAssertEqual(date1, trueDate1)
        XCTAssertEqual(date2, trueDate2)
        XCTAssertEqual(date3, trueDate3)
        XCTAssertEqual(date4, trueDate4)
        XCTAssertEqual(date5, trueDate5)
        XCTAssertEqual(date6, trueDate6)
        XCTAssertEqual(date7, trueDate7)
        XCTAssertEqual(date8, trueDate8)
    }
    
    // MARK: - Sidereal Times
    func testGreenwichMeanSidereal() throws {
        let testDate = Date(julianDay: 2446895.5)
        let trueSidereal = Angle("13h10m46.3668s")!
        let sidereal = testDate.siderealTime(.greenwichMean)
        
        XCTAssertEqual(sidereal.arcseconds, trueSidereal.arcseconds, accuracy: 1e-3)
    }
    
    func testGreenwichApparentSidereal() throws {
        let testDate = Date(julianDay: 2446895.5)
        let trueSidereal = Angle("13h10m46.1351s")!
        let sidereal = testDate.siderealTime(.greenwichApparent)

        XCTAssertEqual(sidereal.arcseconds, trueSidereal.arcseconds, accuracy: 1e-3)
    }
    
    func testLocalMeanSidereal() throws {
        let testDate = Date(julianDay: 2446895.5)
        let trueSidereal = Angle("13h10m46.1351s")!
        let sidereal = testDate.siderealTime(.greenwichApparent)

        XCTAssertEqual(sidereal.arcseconds, trueSidereal.arcseconds, accuracy: 1e-3)
    }

    func testLocalApparentSidereal() throws {
        let testDate = Date(julianDay: 2446895.5)
        let trueSidereal = Angle("13h10m46.1351s")!
        let sidereal = testDate.siderealTime(.greenwichApparent)

        XCTAssertEqual(sidereal.arcseconds, trueSidereal.arcseconds, accuracy: 1e-3)
    }
}
