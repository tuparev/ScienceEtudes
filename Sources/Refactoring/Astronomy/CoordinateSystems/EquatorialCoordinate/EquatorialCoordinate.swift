//
//  EquatorialCoordinate.swift
//
//
//  Created by Hunter William Holland on 22.03.23.
//  Copyright © See Framework's LICENSE file
//

import Foundation
import CoreMaths

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
        let LST = time.siderealTime(.localApparent(longitude: longitude.degrees))
        let RA = self.rightAscension
        return LST - RA
    }
    
    func hourAngle(for coordinate: GeographicCoordinate, at time: Date) -> Angle {
        return self.hourAngle(for: coordinate.longitude, at: time)
    }
    
    func convertToHorizontal(for coordinate: GeographicCoordinate, at time: Date) -> HorizontalCoordinate {
        let h = self.hourAngle(for: coordinate, at: time).radians
        let δ = self.declination.radians
        let φ = coordinate.latitude.radians

        let A_z = Angle(radians: atan(sin(h) / (cos(h)*sin(φ) - tan(δ)*cos(φ))), type: .longitude)
        let a = Angle(radians: asin(sin(φ)*sin(δ) + cos(φ)*cos(δ)*cos(h)), type: .latitude)

        return HorizontalCoordinate(altitude: a, azimuth: A_z, referenceFrame: coordinate)
        
//        let h = self.hourAngle(for: coordinate, at: time).radians
//        let δ = self.declination.radians
//        let φ = coordinate.latitude.radians
//
//        let a = Angle(radians: asin(sin(δ)*sin(φ) + cos(δ)*cos(h)*cos(φ)))
//        var A_z = Angle(radians: acos((sin(δ)*cos(φ) - cos(δ)*cos(h)*sin(φ)) / cos(a.radians)))
//        A_z = sin(A_z.radians) > 0 ? A_z : 360 - A_z
//
//        return HorizontalCoordinate(altitude: a, azimuth: A_z, referenceFrame: coordinate)
        
    }
}
