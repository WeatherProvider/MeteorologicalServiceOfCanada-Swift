//
//  File.swift
//  
//
//  Created by Alan Chu on 9/11/20.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import GEOSwift

class MSCGetStations: Operation {
    let url = URL(string: "https://collaboration.cmc.ec.gc.ca/cmc/cmos/public_doc/msc-data/citypage-weather/site_list_en.geojson")!

    var result: Result<[ObservationStation], Error>?
    var stations: [ObservationStation]?

    var decoder: JSONDecoder

    public init(decoder: JSONDecoder) {
        self.decoder = decoder
    }

    override func main() {
        guard !isCancelled else { return }

        do {
            let data = try Data(contentsOf: url)
            guard !isCancelled else { return }

            let geoJSON = try decoder.decode(GeoJSON.self, from: data)
            guard case let .featureCollection(collection) = geoJSON else { return }

            self.result = .success(collection.features.compactMap { ObservationStation(fromGeoJSONFeature: $0) })
        } catch {
            result = .failure(error)
        }
    }
}
