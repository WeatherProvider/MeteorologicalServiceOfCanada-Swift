import GEOSwift

extension Fixtures {
    // Canada
    static var stanleyPark: Point { Point(x: -123.145848, y: 49.302877) }
    static var cnTower: Point { Point(x: -79.387104, y: 43.642626) }
    static var edmonton: Point { Point(x: -113.491300, y: 53.546225) }

    // USA
    static var bellevue: Point { Point(x: -122.201717, y: 47.617432) }
    static var worldTradeCenter: Point { Point(x: -74.013143, y: 40.712977) }

    // Others
    static var taipei101: Point { Point(x: 121.564644, y: 25.033687) }
    static var bigBen: Point { Point(x: -0.124566, y: 51.500686) }
}

extension Point {
    var asCoordinates: (latitude: Double, longitude: Double) {
        (self.y, self.x)
    }
}
