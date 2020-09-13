import XCTest
import XMLCoder
import GEOSwift
@testable import MeteorologicalServiceOfCanada

final class MeteorologicalServiceOfCanadaTests: XCTestCase {
    let msc = MeteorologicalServiceOfCanada()

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

//    func testOp() {
//        let getStationExpectation = expectation(description: "ah")
//        msc.getStations()
//        msc.didSetStations = {
//            print(self.msc.stations)
//            getStationExpectation.fulfill()
//        }
//
//        waitForExpectations(timeout: 20, handler: nil)
//    }

    func testIsInCanada() {
        // Canada
        let stanleyPark = GEOSwift.Point(x: -123.145848, y: 49.302877)
        let cnTower = GEOSwift.Point(x: -79.387104, y: 43.642626)
        let edmonton = GEOSwift.Point(x: -113.491300, y: 53.546225)

        // USA
        let bellevue = GEOSwift.Point(x: -122.201717, y: 47.617432)
        let worldTradeCenter = GEOSwift.Point(x: -74.013143, y: 40.712977)

        // Others
        let taipei101 = GEOSwift.Point(x: 121.564644, y: 25.033687)
        let bigBen = GEOSwift.Point(x: -0.124566, y: 51.500686)

        let msc = MeteorologicalServiceOfCanada.self

        XCTAssertTrue(try! msc.canada.contains(stanleyPark))
        XCTAssertTrue(try! msc.canada.contains(cnTower))
        XCTAssertTrue(try! msc.canada.contains(edmonton))

        XCTAssertFalse(try! msc.canada.contains(bellevue))
        XCTAssertFalse(try! msc.canada.contains(worldTradeCenter))
        XCTAssertFalse(try! msc.canada.contains(taipei101))
        XCTAssertFalse(try! msc.canada.contains(bigBen))
    }

    static var allTests = [
        ("testSiteData", testSiteData),
        ("testObservationStation", testObservationStation),
        ("testIsInCanada", testIsInCanada)
    ]
}
