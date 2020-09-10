//
//  File.swift
//  
//
//  Created by Alan Chu on 9/10/20.
//

import Foundation
import XMLCoder

public struct DateTime: Decodable, DynamicNodeDecoding {
    enum CodingKeys: String, CodingKey {
        case year, month, day, hour, minute
        case utcOffset = "UTCOffset"
    }

    public let year: Int
    public let month: Int
    public let day: Int

    public let hour: Int
    public let minute: Int

    let utcOffset: Double

    public var components: DateComponents {
        let secondsFromGMT = Int(utcOffset * 60 * 60)
        let timeZone = TimeZone(secondsFromGMT: secondsFromGMT)

        return DateComponents(timeZone: timeZone, year: year, month: month, day: day, hour: hour, minute: minute)
    }

    public var date: Date? {
        return Calendar(identifier: .gregorian).date(from: components)
    }

    public static func nodeDecoding(for key: CodingKey) -> XMLDecoder.NodeDecoding {
        switch key {
        case CodingKeys.utcOffset: return .attribute
        default: return .element
        }
    }
}
