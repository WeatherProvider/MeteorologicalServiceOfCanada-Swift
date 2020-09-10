import XCTest
@testable import MeteorologicalServiceOfCanada

final class MeteorologicalServiceOfCanadaTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MeteorologicalServiceOfCanada().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
