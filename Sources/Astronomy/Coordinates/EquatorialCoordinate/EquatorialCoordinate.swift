//
//  EquatorialCoordinate.swift
//
//
//  Created by Hunter William Holland on 22.03.23.
//  Copyright © See Framework's LICENSE file
//

import Foundation
import CoreMaths
import Time

struct EquatorialCoordinate {
    let rightAscension: Angle
    let declination: Angle
    let epoch: Epoch
    //    let equinox: Equinox?
    
    //    init(rightAscension: Double, declination: Double, epoch: Epoch = .J2000, equinox: Equinox = .standardJ2000) {
    //        self.rightAscension = Angle(degrees: rightAscension)
    //        self.declination = Angle(degrees: declination)
    //        self.epoch = epoch
    //        self.equinox = equinox
    //    }
    
    init(rightAscension: Angle, declination: Angle, epoch: Epoch = .J2000) {
        self.rightAscension = rightAscension
        self.declination = declination
        self.epoch = epoch
    }
    
    init(rightAscension: Double, declination: Double, epoch: Epoch = .J2000) {
        let α = Angle(degrees: rightAscension, type: .longitude)
        let δ = Angle(degrees: declination, type: .latitude)
        self.init(rightAscension: α, declination: δ, epoch: epoch)
    }
    
    func hourAngle(for longitude: Angle, at time: Date) -> Angle {
        time.siderealTime(.localApparent(longitude: longitude.degrees)) - self.rightAscension
    }
    
    func hourAngle(for coordinate: GeographicCoordinate, at time: Date) -> Angle {
        return self.hourAngle(for: coordinate.longitude, at: time)
    }
    
    func convertToHorizontal(for coordinate: GeographicCoordinate, at time: Date) -> HorizontalCoordinate {
        let H = self.hourAngle(for: coordinate, at: time).radians
        let φ = coordinate.latitude.radians
        let δ = self.declination.radians
        
        let tan_A = sin(H) / (cos(H)*sin(φ) - tan(δ)*cos(φ))
        let sin_h = sin(φ)*sin(δ) + cos(φ)*cos(δ)*cos(H)
        
        let A = Angle(radians: atan(tan_A), type: .longitude)
        let h = Angle(radians: asin(sin_h), type: .latitude)
        
        return HorizontalCoordinate(altitude: h, azimuth: A, referenceFrame: coordinate)
    }
}
