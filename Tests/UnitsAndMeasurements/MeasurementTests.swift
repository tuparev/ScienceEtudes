//
//  File.swift
//  
//
//  Created by Georg Tuparev on 24/07/2022.
//

import XCTest
@testable import UnitsAndMeasurements

final class MeasurementTests: XCTestCase {
    
    func test_MeasurementCreation() throws {
        let sut_meters      = Measurement(value: 2, symbol: "m")
        let sut_emptySymbol = Measurement(value: 2, symbol: "")

        XCTAssertNotNil(sut_meters)
        XCTAssertNil(sut_emptySymbol)
    }

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    static var allTests = [
        ("test_MeasurementCreation", test_MeasurementCreation),
    ]

}
