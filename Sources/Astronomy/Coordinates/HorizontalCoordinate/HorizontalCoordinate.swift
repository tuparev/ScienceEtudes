//
//  HorizontalCoordinate.swift
//
//
//  Created by Hunter William Holland on 12.03.23.
//  Copyright © See Framework's LICENSE file
//

import CoreLocation
import CoreMaths

typealias AltAz = HorizontalCoordinate

struct HorizontalCoordinate {
    /// The altitude, measured upward from the horizon.
    let altitude: Angle
    /// The azimuth, measured westward from true south.
    let azimuth: Angle
    /// The coordinate's reference frame.
    ///
    /// This contains information about the latitude, longitude, and altitude of the observer of this coordinate, as well as the time of observation.
    let referenceFrame: GeographicCoordinate?
    
    init(altitude: Angle, azimuth: Angle, referenceFrame: GeographicCoordinate?) {
        self.altitude = altitude
        self.azimuth = azimuth
        self.referenceFrame = referenceFrame
    }
}
