import XCTest
import GEOSwift
@testable import MeteorologicalServiceOfCanada

final class ObservationStationTests: XCTestCase {
    var stations: [ObservationStation] = []

    override func setUp() {
        let geoJSON = try! JSONDecoder().decode(GeoJSON.self, from: Fixtures.Site_List_En)
        guard case let .featureCollection(collection) = geoJSON else { fatalError() }
        self.stations = collection.features.compactMap { ObservationStation(fromGeoJSONFeature: $0) }
    }

    func testGetStation() {
        let coordinate = (49.302877, -123.145848)   // Stanley Park

        let msc = MeteorologicalServiceOfCanada()
        msc.stations = self.stations

        let closestStation = msc.closestStation(to: coordinate)

        XCTAssertEqual(closestStation?.code, "s0000865")
        XCTAssertEqual(closestStation?.name, "West Vancouver")
        XCTAssertEqual(closestStation?.provinceCode, "BC")
        XCTAssertEqual(closestStation!.latitude, 49.33, accuracy: 0.001)
        XCTAssertEqual(closestStation!.longitude, -123.16, accuracy: 0.001)
    }

    static var allTests = [
        ("testGetStation", testGetStation)
    ]
}
