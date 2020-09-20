import Foundation

public struct Wind: Decodable {
    enum CodingKeys: String, CodingKey {
        case speed, /*gust,*/ direction, bearing
    }

    public let speed: Measurement<UnitSpeed>
//    let gust: Measurement<UnitSpeed>?
    public let direction: String

    /// In degrees.
    public let bearing: Double

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let speed = try container.decode(Double.self, forKey: .speed)
        self.speed = Measurement<UnitSpeed>(value: speed, unit: .kilometersPerHour)

//        if let gust = try container.decodeIfPresent(Double.self, forKey: .gust) {
//            self.gust = Measurement<UnitSpeed>(value: gust, unit: .kilometersPerHour)
//        } else {
//            self.gust = nil
//        }

        self.direction = try container.decode(String.self, forKey: .direction)
        self.bearing = try container.decode(Double.self, forKey: .bearing)
    }
}
