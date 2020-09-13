//
//  File.swift
//  
//
//  Created by Alan Chu on 9/12/20.
//

import Foundation
import GEOSwift

class MSCPickStation: Operation {
    enum OperationError: Error {
        case outOfBoundary
        case noStationFound
        case noStations
    }

    var stations: StationsRecord
    var selectedStation: StationRecord

    init(_ stations: StationsRecord, selectedStation: StationRecord) {
        self.stations = stations
        self.selectedStation = selectedStation
    }

    override func main() {
        // Make sure the location is within boundaries
        do {
            let locationPoint = Point(x: selectedStation.location.longitude, y: selectedStation.location.latitude)
            let isInBounds = try stations.boundary.contains(locationPoint)
            guard isInBounds else {
                selectedStation.station = .failure(OperationError.outOfBoundary)
                return
            }
        } catch {
            selectedStation.station = .failure(error)
        }

        // Get the stations from the stations record
        guard let stationResult = self.stations.stations else {
            selectedStation.station = .failure(OperationError.noStations)
            return
        }

        let stations: [ObservationStation]
        do {
            stations = try stationResult.get()
        } catch {
            selectedStation.station = .failure(error)
            return
        }

        // Sort stations by distance
        // TODO: This can be improved.
        let location = self.selectedStation.location
        let sorted = stations.sorted { lhs, rhs in
            distance(from: location, to: (lhs.latitude, lhs.longitude)) < distance(from: location, to: (rhs.latitude, rhs.longitude))
        }

        guard let station = sorted.first else {
            selectedStation.station = .failure(OperationError.noStationFound)
            return
        }

        self.selectedStation.station = .success(station)
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
