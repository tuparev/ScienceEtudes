import XCTest
@testable import UnitsAndMeasurements

final class UnitTests: XCTestCase {
    func test_UnitCreation() throws {
        let sut_meters      = UnitsAndMeasurements.Unit(symbol: "m")
        let sut_emptySymbol = UnitsAndMeasurements.Unit(symbol: "")

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
        ("test_UnitCreation", test_UnitCreation),
    ]

}
