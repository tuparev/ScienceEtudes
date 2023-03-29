//
//  GeographicCoordinate.swift
//
//
//  Created by Hunter William Holland on 22.03.23.
//  Copyright © See Framework's LICENSE file
//

import CoreLocation
import CoreMaths

//typealias GeographicCoordinate = CLLocation

public struct GeographicCoordinate {
    internal let location: CLLocation

    /// The latitude of the coordinate.
    var latitude: Angle { Angle(degrees: location.coordinate.latitude) }
    /// The longitude of the coordinate. Positive values extend eastward, while negative values extend to the west.
    var longitude: Angle { Angle(degrees: location.coordinate.longitude) }
    /// The altitude above sea level at the coordinate's location.
    var altitude: Double { location.altitude }
    /// The time of the coordinate.
    var time: Date { location.timestamp }

    init(latitude: Double, longitude: Double, altitude: Double = 0, time: Date = .now) {
        let coord = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let loc = CLLocation(coordinate: coord, altitude: altitude, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: time)
        self.init(location: loc)
    }

    init(latitude: Angle, longitude: Angle, altitude: Double = 0, time: Date = .now) {
        self.init(latitude: latitude.degrees, longitude: longitude.degrees, altitude: altitude, time: time)
    }

    init(location: CLLocation) {
        self.location = location
    }

}
