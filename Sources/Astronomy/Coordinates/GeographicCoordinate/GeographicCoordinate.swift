//
//  GeographicCoordinate.swift
//
//
//  Created by Hunter William Holland on 22.03.23.
//  Copyright © See Framework's LICENSE file
//

import CoreLocation
import CoreMaths

public struct GeographicCoordinate {
    /// The latitude of the coordinate.
    let latitude: Angle
    /// The longitude of the coordinate. Positive values extend eastward, while negative values extend to the west.
    let longitude: Angle
    /// The altitude above sea level at the coordinate's location.
    let altitude: Double
    /// The time of the coordinate.
    let time: Date

    init(latitude: Double, longitude: Double, altitude: Double = 0, time: Date = .now) {
        let coord = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let loc = CLLocation(coordinate: coord, altitude: altitude, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: time)
        self.init(location: loc)
    }

    init(latitude: Angle, longitude: Angle, altitude: Double = 0, time: Date = .now) {
        self.init(latitude: latitude.degrees, longitude: longitude.degrees, altitude: altitude, time: time)
    }

    init(location: CLLocation) {
        self.latitude = Angle(degree: location.coordinate.latitude)
        self.longitude = Angle(degree: location.coordinate.longitude)
        self.altitude = location.altitude
        self.time = location.timestamp
    }
}
