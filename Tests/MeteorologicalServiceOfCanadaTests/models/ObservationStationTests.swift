import XCTest
import GEOSwift
@testable import MeteorologicalServiceOfCanada

final class ObservationStationTests: XCTestCase {
    let msc = MeteorologicalServiceOfCanada()
    var stations: [ObservationStation] = []

    override func setUp() {
        let geoJSON = try! JSONDecoder().decode(GeoJSON.self, from: Fixtures.Site_List_En)
        guard case let .featureCollection(collection) = geoJSON else { fatalError() }
        self.stations = collection.features.compactMap { ObservationStation(fromGeoJSONFeature: $0) }
    }

    func testDecodeStation() throws {
        let data = try MeteorologicalServiceOfCanada.jsonDecoder.decode(GeoJSON.self, from: Fixtures.Site_List_En)
        guard case let .featureCollection(collection) = data else {
            XCTFail("Expected GeoJSON to be a FeatureCollection.")
            return
        }

        let stations = collection.features.compactMap { feature in
            ObservationStation(fromGeoJSONFeature: feature)
        }

        let stationS1 = stations.first { $0.code == "s0000001" }!
        XCTAssertEqual(stationS1.name, "Athabasca")
        XCTAssertEqual(stationS1.provinceCode, "AB")
        XCTAssertEqual(stationS1.latitude, 54.72, accuracy: 0.001)
        XCTAssertEqual(stationS1.longitude, -113.28, accuracy: 0.001)
    }

    // MARK: - MSCGetStations operation
    func testGetStations() throws {
        let record = StationsRecord(boundary: MeteorologicalServiceOfCanada.canada)
        let getStationsOp = MSCGetStations(decoder: JSONDecoder(), stations: record)
        getStationsOp.start()
        getStationsOp.waitUntilFinished()

        let stations = try record.stations?.get()
        XCTAssertNotNil(stations)
        XCTAssertFalse(stations!.isEmpty)
    }

    // MARK: - MSCPickStation operation
    func testClosestStation() {
        let coordinate = (49.302877, -123.145848)   // Stanley Park

        let stations = StationsRecord(boundary: MeteorologicalServiceOfCanada.canada)
        stations.stations = .success(self.stations)
        let selectedStation = StationRecord(location: coordinate)

        let stationOp = MSCPickStation(stations, selectedStation: selectedStation)
        stationOp.start()
        stationOp.waitUntilFinished()

        let closestStation = try! selectedStation.station!.get()

        XCTAssertEqual(closestStation.code, "s0000865")
        XCTAssertEqual(closestStation.name, "West Vancouver")
        XCTAssertEqual(closestStation.provinceCode, "BC")
        XCTAssertEqual(closestStation.latitude, 49.33, accuracy: 0.001)
        XCTAssertEqual(closestStation.longitude, -123.16, accuracy: 0.001)

        // Should fail.
        let bellevue = StationRecord(location: (47.617432, -122.201717))
        let bellevueStationOp = MSCPickStation(stations, selectedStation: bellevue)
        bellevueStationOp.start()
        bellevueStationOp.waitUntilFinished()

        XCTAssertFailure(bellevue.station!)
    }

    static var allTests = [
        ("testDecodeStation", testDecodeStation),
        ("testGetStations", testGetStations),
        ("testClosestStation", testClosestStation)
    ]
}
