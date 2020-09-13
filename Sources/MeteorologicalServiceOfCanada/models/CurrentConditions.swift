import Foundation
import XMLCoder

public struct CurrentConditions: Decodable {
    enum CodingKeys: String, CodingKey {
        case station, dateTime, temperature, dewpoint, pressure, /*visibility,*/ relativeHumidity, wind
    }

    public let station: String
    public let dateTime: DateTime

    public let temperature: Measurement<UnitTemperature>
    public let dewpoint: Measurement<UnitTemperature>
    public let pressure: Measurement<UnitPressure>
//    public let visibility: Measurement<UnitLength>?
    public let relativeHumidity: Double
    public let wind: Wind

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.station = try container.decode(String.self, forKey: .station)
        self.dateTime = try container.decode(DateTime.self, forKey: .dateTime)

        // TODO: read from units attribute instead of hard coding celsius
        let temperature = try container.decode(Double.self, forKey: .temperature)
        self.temperature = Measurement<UnitTemperature>(value: temperature, unit: .celsius)

        let dewpoint = try container.decode(Double.self, forKey: .dewpoint)
        self.dewpoint = Measurement<UnitTemperature>(value: dewpoint, unit: .celsius)

        let pressure = try container.decode(Double.self, forKey: .pressure)
        self.pressure = Measurement<UnitPressure>(value: pressure, unit: .kilopascals)

//        if let visibility = try container.decodeIfPresent(Double.self, forKey: .visibility) {
//            self.visibility = Measurement<UnitLength>(value: visibility, unit: .kilometers)
//        } else {
//            self.visibility = nil
//        }

        let relativeHumidity = try container.decode(Double.self, forKey: .relativeHumidity)
        self.relativeHumidity = relativeHumidity * 0.01

        self.wind = try container.decode(Wind.self, forKey: .wind)
    }
}
