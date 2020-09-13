//
//  MeteorologicalServiceOfCanada.swift
//  
//
//  Created by Alan Chu on 9/10/20.
//

import Foundation
import GEOSwift
import XMLCoder

public class MeteorologicalServiceOfCanada {
    let jsonDecoder = JSONDecoder()
    let xmlDecoder = XMLDecoder()

    let canada: Geometry

    var operationQueue: OperationQueue

    var getStationsOperation: MSCGetStations?
    var stations: [ObservationStation]? {
        didSet {
            print("didSet stations: \(stations)")
            didSetStations?()
        }
    }

    var didSetStations: (() -> Void)?

    init() {
        self.operationQueue = OperationQueue()
        self.operationQueue.name = "MSC_Queue"
        self.operationQueue.maxConcurrentOperationCount = 1

        let geoJSON = try! jsonDecoder.decode(GeoJSON.self, from: MeteorologicalServiceOfCanada.CanadaBoundariesData)
        guard case let .geometry(geometry) = geoJSON else { fatalError() }
        self.canada = geometry
    }

    func getStations() -> MSCGetStations {
        let op = MSCGetStations(decoder: jsonDecoder)
        op.completionBlock = {
            if op.isCancelled { return }

            DispatchQueue.main.async {
                self.stations = op.stations
            }
        }
        operationQueue.addOperation(op)
        return op
    }

    func getCurrentConditions(at location: (latitude: Double, longitude: Double)) {
    }

    func closestStation(to coordinate: (latitude: Double, longitude: Double)) -> ObservationStation? {
        // TODO: this can be improved
        guard let stations = self.stations else { return nil }
        let sorted = stations.sorted { lhs, rhs in
            distance(from: coordinate, to: (lhs.latitude, lhs.longitude)) < distance(from: coordinate, to: (rhs.latitude, rhs.longitude))
        }

        return sorted.first
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
