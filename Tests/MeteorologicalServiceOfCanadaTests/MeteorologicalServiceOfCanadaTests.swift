import XCTest
import XMLCoder
@testable import MeteorologicalServiceOfCanada

final class MeteorologicalServiceOfCanadaTests: XCTestCase {
    func testExample() {
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

    static var allTests = [
        ("testExample", testExample),
    ]
}
