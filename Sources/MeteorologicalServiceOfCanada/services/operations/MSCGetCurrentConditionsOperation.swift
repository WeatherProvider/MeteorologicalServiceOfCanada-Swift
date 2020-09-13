//
//  File.swift
//  
//
//  Created by Alan Chu on 9/12/20.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import XMLCoder

class MSCGetCurrentConditions: Operation {
    var station: StationRecord
    var xmlDecoder: XMLDecoder

    init(xmlDecoder: XMLDecoder, station: StationRecord) {
        self.xmlDecoder = xmlDecoder
        self.station = station
    }

    override func main() {
        guard let station = self.station.station else { return }
        guard !isCancelled else { return }

        let urlString = "https://dd.weather.gc.ca/citypage_weather/xml/\(station.provinceCode)/\(station.code)_e.xml"
        let url = URL(string: urlString)!
        do {
            let data = try Data(contentsOf: url)
            let conditions = try xmlDecoder.decode(CurrentConditions.self, from: data)
            self.station.currentConditions = .success(conditions)
        } catch {
            self.station.currentConditions = .failure(error)
        }
    }
}
