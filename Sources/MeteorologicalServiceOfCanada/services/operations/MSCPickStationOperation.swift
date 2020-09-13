//
//  File.swift
//  
//
//  Created by Alan Chu on 9/12/20.
//

import Foundation
import GEOSwift

class MSCPickStation: Operation {
    var stations: StationsRecord
    var selectedStation: StationRecord

    init(_ stations: StationsRecord, selectedStation: StationRecord) {
        self.stations = stations
        self.selectedStation = selectedStation
    }

    override func main() {
        guard let stations = try? self.stations.stations?.get() else { return }

        let location = self.selectedStation.location 

        let sorted = stations.sorted { lhs, rhs in
            distance(from: location, to: (lhs.latitude, lhs.longitude)) < distance(from: location, to: (rhs.latitude, rhs.longitude))
        }

        self.selectedStation.station = sorted.first
    }

    private func distance(from lhs: (latitude: Double, longitude: Double), to rhs: (latitude: Double, longitude: Double)) -> Double {
        // Original from: https://github.com/petrpavlik/GeoSwift. MIT License.
        // Algorithm shamelessly copied from http://www.movable-type.co.uk/scripts/latlong.html
        let R = 6371e3
        let φ1 = rhs.latitude * Double.pi / 180
        let φ2 = lhs.latitude * Double.pi / 180
        let Δφ = (lhs.latitude - rhs.latitude) * Double.pi / 180
        let Δλ = (lhs.longitude - rhs.longitude) * Double.pi / 180

        // Broken into 2 expressions to avoid 'expression too complex' error on linux
        var a = sin(Δφ/2) * sin(Δφ/2)
        a += cos(φ1) * cos(φ2) * sin(Δλ/2) * sin(Δλ/2)

        let c = 2 * atan2(sqrt(a), sqrt(1-a));

        return R * c;
    }
}
