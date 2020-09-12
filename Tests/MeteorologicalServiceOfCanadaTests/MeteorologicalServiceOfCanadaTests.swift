import XCTest
import XMLCoder
import GEOSwift
@testable import MeteorologicalServiceOfCanada

final class MeteorologicalServiceOfCanadaTests: XCTestCase {
    func testSiteData() {
        let decoder = XMLDecoder()
        let data = Fixtures.CityPage_Weather_BC_S2_E

        let siteData = try! decoder.decode(SiteData.self, from: data)

        XCTAssertEqual(siteData.location.continent, "North America")
        XCTAssertEqual(siteData.location.country, "Canada")
        XCTAssertEqual(siteData.location.province, "British Columbia")
        XCTAssertEqual(siteData.location.name, "Clearwater")
        XCTAssertEqual(siteData.location.region, "North Thompson")

        let date = ISO8601DateFormatter().date(from: "2020-09-10T10:09:00-07:00")!
        XCTAssertEqual(Calendar.current.compare(siteData.createdAt, to: date, toGranularity: .minute), .orderedSame)

        XCTAssertEqual(siteData.currentConditions.station, "Clearwater")
        XCTAssertEqual(siteData.currentConditions.temperature, Measurement<UnitTemperature>(value: 16.2, unit: .celsius))
        XCTAssertEqual(siteData.currentConditions.dewpoint, Measurement<UnitTemperature>(value: 7.7, unit: .celsius))
        XCTAssertEqual(siteData.currentConditions.pressure, Measurement<UnitPressure>(value: 102.0, unit: .kilopascals))
        XCTAssertEqual(siteData.currentConditions.relativeHumidity, 0.57, accuracy: 0.001)

        XCTAssertEqual(siteData.currentConditions.wind.speed, Measurement<UnitSpeed>(value: 4, unit: .kilometersPerHour))
        XCTAssertEqual(siteData.currentConditions.wind.direction, "ESE")
        XCTAssertEqual(siteData.currentConditions.wind.bearing, 120.8, accuracy: 0.01)
    }

    func testObservationStation() {
        let decoder = JSONDecoder()
        let data = try! decoder.decode(GeoJSON.self, from: Fixtures.Site_List_En)
        guard case let .featureCollection(collection) = data else {
            XCTFail()
            return
        }

        let stations = collection.features.compactMap { feature in
            ObservationStation(fromGeoJSONFeature: feature)
        }

        let stationS1 = stations.filter { $0.code == "s0000001" }.first!
        XCTAssertEqual(stationS1.name, "Athabasca")
        XCTAssertEqual(stationS1.provinceCode, "AB")
        XCTAssertEqual(stationS1.latitude, 54.72, accuracy: 0.001)
        XCTAssertEqual(stationS1.longitude, -113.28, accuracy: 0.001)
    }

    func testOp() {
        let msc = MeteorologicalServiceOfCanada()
        let getStationExpectation = expectation(description: "ah")
        msc.getStations()
        msc.didSetStations = {
            print(msc.stations)
            getStationExpectation.fulfill()
        }

        waitForExpectations(timeout: 20, handler: nil)
    }

    static var allTests = [
        ("testSiteData", testSiteData),
        ("testObservationStation", testObservationStation)
    ]
}
