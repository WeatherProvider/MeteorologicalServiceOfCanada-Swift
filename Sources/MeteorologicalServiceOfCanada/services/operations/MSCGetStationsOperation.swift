import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import GEOSwift

class MSCGetStations: Operation {
    let url = URL(string: "https://collaboration.cmc.ec.gc.ca/cmc/cmos/public_doc/msc-data/citypage-weather/site_list_en.geojson")!

    var stations: StationsRecord

    var decoder: JSONDecoder

    public init(decoder: JSONDecoder, stations: StationsRecord) {
        self.decoder = decoder
        self.stations = stations
    }

    override func main() {
        guard !isCancelled else { return }

        do {
            let data = try Data(contentsOf: url)
            guard !isCancelled else { return }

            let geoJSON = try decoder.decode(GeoJSON.self, from: data)
            guard case let .featureCollection(collection) = geoJSON else { return }

            self.stations.stations = .success(collection.features.compactMap { ObservationStation(fromGeoJSONFeature: $0) })
        } catch {
            self.stations.stations = .failure(error)
        }
    }
}
