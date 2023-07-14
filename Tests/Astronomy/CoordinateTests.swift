//
//  CoordinateTests.swift
//  Coordinates-Tests
//
//  Created by Hunter Holland on 2/22/23.
//

import XCTest
@testable import CoreMaths
@testable import Astronomy

final class CoordinateTests: XCTestCase {
    
    func testEquatorialToHorizontal() throws {
        let components = DateComponents(year: 1987, month: 4, day: 10, hour: 19, minute: 21, second: 00)
        let date = Calendar.gregorianUTC.date(from: components)!
        
        let lat = Angle("+38d55m18s", type: .latitude)!
        let lon = Angle("-77d03m56s",  type: .longitude)!
        let location = GeographicCoordinate(latitude: lat, longitude: lon)
        
        let α = Angle("+23h09m16.641s", type: .longitude)!
        let δ = Angle("-06d43m11.610s", type: .latitude)!
        let coordinate = EquatorialCoordinate(rightAscension: α, declination: δ)
        
        let converted = coordinate.convertToHorizontal(for: location, at: date)
        
        let trueAlt = Angle(degree: 15.1249, type: .latitude)
        let trueAz = Angle(degree: 68.0337, type: .longitude)
        
        XCTAssertEqual(converted.altitude.arcseconds, trueAlt.arcseconds, accuracy: 1e-3)
        XCTAssertEqual(converted.azimuth.arcseconds, trueAz.arcseconds, accuracy: 1e-3)
    }
    
//    
//    //    func testPerformanceExample() throws {
//    //        // This is an example of a performance test case.
//    //        self.measure {
//    //            // Put the code you want to measure the time of here.
//    //        }
//    //    }
    
}
