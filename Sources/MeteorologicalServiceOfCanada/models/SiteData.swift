import Foundation

public struct SiteData: Decodable {
    public enum CodingKeys: String, CodingKey {
        case dateTimes = "dateTime"
        case currentConditions //= "currentconditions"
        case location
    }

    private let dateTimes: [DateTime]

    public var createdAt: Date {
        // TODO: force unwrap
        return dateTimes.first!.date!
    }

//    public let language: MSCLanguage
    public let location: Location
    public let currentConditions: CurrentConditions
}
