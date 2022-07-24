//
//  File.swift
//  
//
//  Created by Georg Tuparev on 24/07/2022.
//

import XCTest

import SienceEtudesTests

var tests = [XCTestCaseEntry]()
tests += UnitTests.allTests()
tests += MeasurementTests.allTests

XCTMain(tests)
