//
//  File.swift
//  
//
//  Created by Alan Chu on 9/12/20.
//

import Foundation
import GEOSwift

class StationsRecord {
    var stations: Result<[ObservationStation], Error>?
    var boundary: Geometry

    init(boundary: Geometry) {
        self.boundary = boundary
    }
}

class StationRecord {
    var location: (latitude: Double, longitude: Double)
    var station: ObservationStation?
    var currentConditions: Result<CurrentConditions, Error>?

    init(location: (latitude: Double, longitude: Double)) {
        self.location = location
    }
}
