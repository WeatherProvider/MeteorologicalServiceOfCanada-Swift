import XCTest
import GEOSwift
@testable import MeteorologicalServiceOfCanada

final class ObservationStationTests: XCTestCase {
    let msc = MeteorologicalServiceOfCanada()
    var stations: [ObservationStation] = []

    override func setUpWithError() throws {
        let geoJSON = try MeteorologicalServiceOfCanada.jsonDecoder.decode(GeoJSON.self, from: Fixtures.Site_List_En)
        guard case let .featureCollection(collection) = geoJSON else { fatalError("Expected a feature collection") }
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

        let stationS1 = stations.filter { $0.code == "s0000001" }.first
        XCTAssertNotNil(stationS1)
        XCTAssertEqual(stationS1!.name, "Athabasca")
        XCTAssertEqual(stationS1!.provinceCode, "AB")
        XCTAssertEqual(stationS1!.latitude, 54.72, accuracy: 0.001)
        XCTAssertEqual(stationS1!.longitude, -113.28, accuracy: 0.001)
    }

    // MARK: - MSCGetStations operation
    func testGetStations() throws {
        let record = StationsRecord(boundary: MeteorologicalServiceOfCanada.canada)
        let getStationsOp = MSCGetStations(decoder: MeteorologicalServiceOfCanada.jsonDecoder, stations: record)
        getStationsOp.start()
        getStationsOp.waitUntilFinished()

        let stations = try record.stations?.get()
        XCTAssertNotNil(stations)
        XCTAssertFalse(stations!.isEmpty)
    }

    // MARK: - MSCPickStation operation
    func testClosestStation() {
        let stations = StationsRecord(boundary: MeteorologicalServiceOfCanada.canada)
        stations.stations = .success(self.stations)

        let stanleyParkRecord = StationRecord(location: Fixtures.stanleyPark.asCoordinates)
        let standleyParkStationOp = MSCPickStation(stations, selectedStation: stanleyParkRecord)
        standleyParkStationOp.start()
        standleyParkStationOp.waitUntilFinished()

        let closestStation = try! stanleyParkRecord.station!.get()

        XCTAssertEqual(closestStation.code, "s0000865")
        XCTAssertEqual(closestStation.name, "West Vancouver")
        XCTAssertEqual(closestStation.provinceCode, "BC")
        XCTAssertEqual(closestStation.latitude, 49.33, accuracy: 0.001)
        XCTAssertEqual(closestStation.longitude, -123.16, accuracy: 0.001)

        // Should fail.
        let bellevueRecord = StationRecord(location: Fixtures.bellevue.asCoordinates)
        let bellevueStationOp = MSCPickStation(stations, selectedStation: bellevueRecord)
        bellevueStationOp.start()
        bellevueStationOp.waitUntilFinished()

        XCTAssertFailure(bellevueRecord.station!)
    }

    static var allTests = [
        ("testDecodeStation", testDecodeStation),
        ("testGetStations", testGetStations),
        ("testClosestStation", testClosestStation)
    ]
}
