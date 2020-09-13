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
    let session: URLSession = URLSession(configuration: .ephemeral)
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
}
