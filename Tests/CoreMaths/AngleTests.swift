//
//  AngleArithmeticTests.swift
//  CoreMathsTests
//
//  Created by Hunter Holland on 12/30/22.
//

import XCTest
@testable import CoreMaths

final class AngleTests: XCTestCase {
    // MARK: Initialization
    func testDMSAngleCreation() throws {
        let angle1String = "12d34m56.7s"
        let angle2String = "12º34'56.7\""
        let angle3String = "12de34m56.7q"
        
        XCTAssertNotNil(Angle(angle1String))
        XCTAssertNotNil(Angle(angle2String))
        XCTAssertNil(Angle(angle3String))
    }
    
    func testHMSAngleCreation() throws {
        let angle1String = "12h34m56.7s"
        let angle2String = "12hrs34min56.7sec"
        let angle3String = "12hr34mi56.7se"
        
        XCTAssertNotNil(Angle(angle1String))
        XCTAssertNotNil(Angle(angle2String))
        XCTAssertNil(Angle(angle3String))
    }
    
    // MARK: Angle/Angle Operations
    func testAngleAddition() throws {
        var angle1 = Angle(degrees: 5)
        let angle2 = Angle(degrees: 5)
        
        let sum = angle1 + angle2
        
        XCTAssertEqual(sum.degrees, 10)
        
        angle1 += angle2
        
        XCTAssertEqual(angle1.degrees, 10)
    }
    
    func testAngleSubtraction() throws {
        var angle1 = Angle(degrees: 5)
        let angle2 = Angle(degrees: 5)
        
        let difference = angle1 - angle2
        
        XCTAssertEqual(difference, Angle.zero)
        
        angle1 -= angle2
        
        XCTAssertEqual(angle1, Angle.zero)
    }
    
    // MARK: Angle/Scalar Operations
    func testAngleScalarAddition() throws {
        var angle = Angle(degrees: 90)
        
        let sum1 = angle + 90
        let sum2 = 90 + angle
        
        XCTAssertEqual(sum1.degrees, 180)
        XCTAssertEqual(sum2.degrees, 180)
        
        angle += 90
        
        XCTAssertEqual(angle.degrees, 180)
    }
    
    func testAngleScalarSubtraction() throws {
        var angle = Angle(degrees: 90)
        
        let difference1 = angle - 90
        let difference2 = 90 - angle
        
        XCTAssertEqual(difference1, Angle.zero)
        XCTAssertEqual(difference2, Angle.zero)
        
        angle -= 90
        
        XCTAssertEqual(angle, Angle.zero)
    }
    
    func testAngleScalarMultiplication() throws {
        var angle = Angle(degrees: 5)
        
        let product1 = angle * 2
        let product2 = 2 * angle
        
        XCTAssertEqual(product1.degrees, 10)
        XCTAssertEqual(product2.degrees, 10)
        
        angle *= 2
        
        XCTAssertEqual(angle.degrees, 10)
    }
    
    func testAngleScalarDivision() throws {
        var angle = Angle(degrees: 10)
        
        let quotient = angle / 2
        
        XCTAssertEqual(quotient.degrees, 5)
        
        angle /= 2
        
        XCTAssertEqual(angle.degrees, 5)
    }
    
    // MARK: Angle Wrapping
//    func testAngleWrapping() throws {
//        var angle1 = Angle(degrees: 180, type: .geographicLatitude)
//        angle1 += 45
//        XCTAssertEqual(angle1.degrees, 45)
//        angle1 += 45
//        XCTAssertEqual(angle1.degrees, 90)
//        angle1 += 45
//        XCTAssertEqual(angle1.degrees, -45)
//        angle1 += 45
//        XCTAssertEqual(angle1.degrees, 0)
//        angle1 -= 90
//        XCTAssertEqual(angle1.degrees, -90)
//
//        var angle2 = Angle(degrees: 540, type: .rightAscension)
//        angle2 += 90
//        XCTAssertEqual(angle2.degrees, 270)
//        angle2 += 90
//        XCTAssertEqual(angle2.degrees, 0)
//        angle2 -= 360
//        XCTAssertEqual(angle2.degrees, 0)
//        angle2 += 90
//        XCTAssertEqual(angle2.degrees, 90)
//        angle2 += 90
//        XCTAssertEqual(angle2.degrees, 180)
//
//        var angle3 = Angle(degrees: 0, type: .geographicLongitude)
//        angle3 += 90
//        XCTAssertEqual(angle3.degrees, 90)
//        angle3 += 90
//        XCTAssertEqual(angle3.degrees, -180)
//        angle3 += 90
//        XCTAssertEqual(angle3.degrees, -90)
//        angle3 += 90
//        XCTAssertEqual(angle3.degrees, 0)
//    }
    
}
