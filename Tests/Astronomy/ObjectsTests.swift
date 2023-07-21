//
//  ObjectsTests.swift
//
//  Created by Hunter Holland on 7/18/23.
//

import XCTest
@testable import CoreMaths
@testable import Astronomy

final class ObjectsTests: XCTestCase {
    
    func testPlanetPositionCalculation() throws {
        let now = Date.now
        let mars = Planet.mars
        let position = mars.position(on: now)
        print(position)
        
    }

}
