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

    func testIsInCanada() {
        let msc = MeteorologicalServiceOfCanada.self

        XCTAssertTrue(try! msc.canada.contains(Fixtures.stanleyPark))
        XCTAssertTrue(try! msc.canada.contains(Fixtures.cnTower))
        XCTAssertTrue(try! msc.canada.contains(Fixtures.edmonton))

        XCTAssertFalse(try! msc.canada.contains(Fixtures.bellevue))
        XCTAssertFalse(try! msc.canada.contains(Fixtures.worldTradeCenter))
        XCTAssertFalse(try! msc.canada.contains(Fixtures.taipei101))
        XCTAssertFalse(try! msc.canada.contains(Fixtures.bigBen))
    }

    func testIntegrationCurrentConditions() {
        let getStanleyPark = self.expectation(description: "Get current conditions at Stanley Park")
        msc.getCurrentConditions(at: Fixtures.stanleyPark.asCoordinates) { result in
            XCTAssertSuccess(result)
            getStanleyPark.fulfill()
        }

        waitForExpectations(timeout: 10)

        let getCNTower = self.expectation(description: "Get current conditions at the CN Tower")
        msc.getCurrentConditions(at: Fixtures.cnTower.asCoordinates) { result in
            XCTAssertSuccess(result)
            getCNTower.fulfill()
        }

        waitForExpectations(timeout: 5)

        // This should fail, Bellevue isn't in Canada.
        let getBellevue = self.expectation(description: "Get current conditions at Bellevue, WA, USA")
        msc.getCurrentConditions(at: Fixtures.bellevue.asCoordinates) { result in
            XCTAssertFailure(result)
            getBellevue.fulfill()
        }

        waitForExpectations(timeout: 5)
    }

    static var allTests = [
        ("testSiteData", testSiteData),
        ("testIsInCanada", testIsInCanada),
        ("testIntegrationCurrentConditions", testIntegrationCurrentConditions)
    ]
}
