import Foundation
import GEOSwift
import XMLCoder

public class MeteorologicalServiceOfCanada {
    static var jsonDecoder = JSONDecoder()
    let xmlDecoder = XMLDecoder()

    var operationQueue: OperationQueue
    var stations: StationsRecord
    var getStationsOperation: MSCGetStations

    static var canada: Geometry = {
        let geoJSON = try! jsonDecoder.decode(GeoJSON.self, from: MeteorologicalServiceOfCanada.CanadaBoundariesData)
        guard case let .geometry(canada) = geoJSON else { fatalError() }
        return canada
    }()

    init() {
        self.operationQueue = OperationQueue()
        self.operationQueue.name = "MSC_Queue"
        self.operationQueue.maxConcurrentOperationCount = 1

        self.stations = StationsRecord(boundary: MeteorologicalServiceOfCanada.canada)

        self.getStationsOperation = MSCGetStations(decoder: MeteorologicalServiceOfCanada.jsonDecoder, stations: stations)
    }

    func getStations() {
        operationQueue.addOperation(getStationsOperation)
    }

    func getCurrentConditions(at location: (latitude: Double, longitude: Double),
                              then handler: @escaping (Result<CurrentConditions, Error>) -> Void) {
        let selectedStation = StationRecord(location: location)

        if !operationQueue.doesContain(getStationsOperation) && !getStationsOperation.isFinished {
            operationQueue.addOperation(getStationsOperation)
        }

        let pickStation = MSCPickStation(stations, selectedStation: selectedStation)
        pickStation.addDependency(getStationsOperation)
        operationQueue.addOperation(pickStation)

        let currentConditions = MSCGetCurrentConditions(xmlDecoder: xmlDecoder, station: selectedStation)
        currentConditions.addDependency(pickStation)
        operationQueue.addOperation(currentConditions)

        currentConditions.completionBlock = {
            handler(selectedStation.currentConditions!)
        }
    }
}
