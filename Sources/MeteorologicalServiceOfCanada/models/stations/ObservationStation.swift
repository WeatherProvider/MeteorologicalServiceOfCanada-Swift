//
//  File.swift
//  
//
//  Created by Alan Chu on 9/10/20.
//

import Foundation
import GEOSwift

public struct ObservationStation: Codable {
    public enum CodingKeys: String, CodingKey {
        case code = "Codes",
             name = "English Names",
             provinceCode = "Province Codes",
             latitude = "Latitude",
             longitude = "Longitude"
    }

    public var code: String
    public var name: String

    public var provinceCode: String
    public var latitude: Double
    public var longitude: Double

    public init?(fromGeoJSONFeature feature: Feature) {
        guard case let .string(code) = feature.properties?[CodingKeys.code.rawValue],
              case let .string(name) = feature.properties?[CodingKeys.name.rawValue],
              case let .string(province) = feature.properties?[CodingKeys.provinceCode.rawValue],
              case let .number(latitude) = feature.properties?[CodingKeys.latitude.rawValue],
              case let .number(longitude) = feature.properties?[CodingKeys.longitude.rawValue]
              else { return nil }

        self.code = code
        self.name = name
        self.provinceCode = province
        self.latitude = latitude
        self.longitude = longitude
    }
}
