//
//  SiderealTime.swift
//  
//
//  Created by Hunter Holland on 2/23/23.
//

import Foundation
import CoreMaths
import SoftwareEtudesUtilities

@frozen public enum SiderealTime {
    case greenwichMean
    case greenwichApparent
    case localMean(longitude: Double)
    case localApparent(longitude: Double)
}

public extension Date {
    func siderealTime(_ type: SiderealTime) -> Angle {
        switch type {
        case .greenwichMean:
            // TODO: This is only accurate to the milli-degree. Something is wrong.
            let ERA = self.earthRotationAngle
            let p = self.accumulatedPrecession
            return ERA - p
        case .greenwichApparent:
            let GMST = siderealTime(.greenwichMean)
            return GMST + equationOfTheEquinoxes
        case .localMean(let lon):
            let GMST = siderealTime(.greenwichMean)
            return GMST + Angle(degrees: lon, type: .longitude)
        case .localApparent(let lon):
            let GAST = siderealTime(.greenwichApparent)
            return GAST + Angle(degrees: lon, type: .longitude)
        }
    }
    
    var accumulatedPrecession: Angle {
        let t = (self.tt.julianDay - Date.J2000.tt.julianDay) / 36525.0
        let angle = Angle(arcsecond: -0.014506) - t * Angle(arcsecond: 4612.156_534) -
               pow(t, 2) * Angle(arcsecond: 1.391_5817) + pow(t, 3) * Angle(arcsecond: 0.000_000_44) +
               pow(t, 4) * Angle(arcsecond: 0.000_029_956)
        return Angle(degree: angle.degrees, type: .longitude)
    }
    
    var equationOfTheEquinoxes: Angle {
        let t = (self.tt.julianDay - Date.J2000.tt.julianDay) / 36525.0
        let F = 0.0, D = 0.0, Ω = 0.0
        // TODO: Implement tables to store the following values. These placeholders hold only for Jan. 0, 2006.
        let Δψ = Angle(arcsecond: -2.1954), ε_A = Angle(degree: 23, arcminute: 26, arcsecond: 26.9813)
        
        let comp0 = Δψ * cos(ε_A.degrees)
        let comp1 = +0.002_640_96 * sin(Ω)
        let comp2 = +0.000_063_52 * sin(2*Ω)
        let comp3 = +0.000_011_75 * sin(2*F - 2*D + 3*Ω)
        let comp4 = +0.000_011_21 * sin(2*F - 2*D + Ω)
        let comp5 = -0.000_004_55 * sin(2*F - 2*D + 2*Ω)
        let comp6 = +0.000_002_02 * sin(2*F + 3*Ω)
        let comp7 = +0.000_001_98 * sin(2*F + Ω)
        let comp8 = -0.000_001_72 * sin(3*Ω)
        let comp9 = -0.000_000_87 * sin(Ω) * t
        
        let sum1 = comp0 + comp1 + comp2 + comp3 + comp4
        let sum2 = comp5 + comp6 + comp7 + comp8 + comp9
        
        return sum1 + sum2
    }
    
    var equationOfTheOrigins: Angle {
        accumulatedPrecession - equationOfTheEquinoxes
    }
}


// MARK: - Earth Rotation Angle
public extension Date {
    /// The rotation angle of the Earth from the Celestial Intermediate Origin.
    var earthRotationAngle: Angle {
        let t_u = julianDay - Self.J2000.julianDay
        let θ = 2 * Double.pi * (0.779_057_273_2640 + 1.002_737_811_911_354_48*t_u)
        return Angle(radians: θ, type: .longitude)
    }
}
