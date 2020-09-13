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
    var station: ObservationStation?
    var xmlDecoder: XMLDecoder

    var result: Result<CurrentConditions, Error>?

    init(xmlDecoder: XMLDecoder) {
        self.xmlDecoder = xmlDecoder
    }

    override func main() {
        guard let station = self.station else { return }
        guard !isCancelled else { return }

        let urlString = "https://dd.weather.gc.ca/citypage_weather/xml/\(station.provinceCode)/\(station.code)_e.xml"
        let url = URL(string: urlString)!
        do {
            let data = try Data(contentsOf: url)
            let conditions = try xmlDecoder.decode(CurrentConditions.self, from: data)
            result = .success(conditions)
        } catch {
            result = .failure(error)
        }
    }
}
