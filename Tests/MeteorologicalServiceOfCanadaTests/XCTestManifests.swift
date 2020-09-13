import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MeteorologicalServiceOfCanadaTests.allTests),
        testCase(ObservationStationTests.allTests)
    ]
}
#endif
