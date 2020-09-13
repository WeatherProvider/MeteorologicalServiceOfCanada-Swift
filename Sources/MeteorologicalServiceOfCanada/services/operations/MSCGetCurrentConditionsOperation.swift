import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import XMLCoder

class MSCGetCurrentConditions: Operation {
    enum OperationError: Error {
        case noStations
    }

    var station: StationRecord
    var xmlDecoder: XMLDecoder

    init(xmlDecoder: XMLDecoder, station: StationRecord) {
        self.xmlDecoder = xmlDecoder
        self.station = station
    }

    override func main() {
        guard !isCancelled else { return }
        guard let stationResult = self.station.station else {
            self.station.currentConditions = .failure(OperationError.noStations)
            return
        }

        let station: ObservationStation
        do {
            station = try stationResult.get()
        } catch {
            self.station.currentConditions = .failure(error)
            return
        }

        guard !isCancelled else { return }

        let urlString = "https://dd.weather.gc.ca/citypage_weather/xml/\(station.provinceCode)/\(station.code)_e.xml"
        let url = URL(string: urlString)!
        do {
            let data = try Data(contentsOf: url)
            let siteData = try xmlDecoder.decode(SiteData.self, from: data)
            self.station.currentConditions = .success(siteData.currentConditions)
        } catch {
            self.station.currentConditions = .failure(error)
        }
    }
}
