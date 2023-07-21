//
//  SolarSystemEphemerides.swift
//  
//
//  Created by Hunter Holland on 7/11/23.
//

import Foundation
import CoreMaths

public struct KeplerianElements {
    var semiMajorAxis: Double
    var eccentricity: Angle
    var inclination: Angle
    var meanLongitude: Angle
    var longitudeOfPerihelion: Angle
    var longitudeOfAscendingNode: Angle
    
    init(semiMajorAxis: Double,
         eccentricity: Double,
         inclination: Double,
         meanLongitude: Double,
         longitudeOfPerihelion: Double,
         longitudeOfAscendingNode: Double) {
        self.semiMajorAxis = semiMajorAxis
        self.eccentricity = Angle(radians: eccentricity)
        self.inclination = Angle(radians: inclination)
        self.meanLongitude = Angle(radians: meanLongitude)
        self.longitudeOfPerihelion = Angle(radians: longitudeOfPerihelion)
        self.longitudeOfAscendingNode = Angle(radians: longitudeOfAscendingNode)
    }
    
    init(_ a: Double,
         _ e: Double,
         _ I: Double,
         _ L: Double,
         _ lonPeri: Double,
         _ lonNode: Double) {
        self.init(semiMajorAxis: a,
                  eccentricity: e,
                  inclination: I,
                  meanLongitude: L,
                  longitudeOfPerihelion: lonPeri,
                  longitudeOfAscendingNode: lonNode)
    }
    
    var a:       Double {
        get { self.semiMajorAxis }
        set { self.semiMajorAxis = newValue }
    }
    var e:       Angle  {
        get { self.eccentricity }
        set { self.eccentricity = newValue }
    }
    var I:       Angle  {
        get { self.inclination }
        set { self.inclination = newValue }
    }
    var L:       Angle  {
        get { self.meanLongitude }
        set { self.meanLongitude = newValue }
    }
    var lonPeri: Angle  {
        get { self.longitudeOfPerihelion }
        set { self.longitudeOfPerihelion = newValue }
    }
    var lonNode: Angle  {
        get { self.longitudeOfAscendingNode }
        set { self.longitudeOfAscendingNode = newValue }
    }
}

protocol OrbitingBody {
    var orbitalElements: KeplerianElements? { get set }
    var orbitalRates: KeplerianElements? { get set }
}

extension OrbitingBody {
    func position(on date: Date) -> (Double, Double, Double)? {
        guard var e = orbitalElements, let rates = orbitalRates else { return nil }
        
        /// The number of centuries past J2000.
        let T = (date.jd - Epoch.J2000.jd) / 36525
        e.a += rates.a * T
        e.e += rates.e * T
        e.I += rates.I * T
        e.L += rates.L * T
        e.lonPeri += rates.lonPeri * T
        e.lonNode += rates.lonNode * T
        
        // Mean anomaly
        let M = (e.meanLongitude - e.longitudeOfPerihelion).wrap(into: -180...180)
        
        // Calculate eccentric anomaly
        var E = M - e.e.degrees * sin(M.radians)
        var ΔE = Double.infinity
        while abs(ΔE) > 1.0e-6 {
            let ΔM = M - (E - e.e.degrees * sin(E.radians))
            ΔE = (ΔM / (1 - e.e.radians * cos(E.radians))).degrees
            E += ΔE
        }
        
        // The planet's heliocentric coordinates in its orbital plane
        let x = e.a * (cos(E.radians) - e.e.radians)
        let y = e.a * sqrt(1 - pow(e.e.radians, 2)) * sin(E.radians)
        let z = 0.0
        
        // Argument of perihelion
        let ω = e.lonPeri - e.lonNode
        
        return (x, y, z)
    }
}

struct Planet: OrbitingBody {
    var orbitalElements: KeplerianElements?
    var orbitalRates: KeplerianElements?
}

extension Planet {
    public static var mercury: Planet {
        let elems = KeplerianElements(0.38709927, 0.20563593,  7.00497902,    252.25032350, 77.45779628, 48.33076593)
        let rates = KeplerianElements(0.00000037, 0.00001906, -0.00594749, 149472.67411175,  0.16047689, -0.12534081)
        return Planet(orbitalElements: elems, orbitalRates: rates)
    }
    
    public static var venus: Planet {
        let elems = KeplerianElements(0.72333566,  0.00677672,  3.39467605,   181.97909950, 131.60246718, 76.67984255)
        let rates = KeplerianElements(0.00000390, -0.00004107, -0.00078890, 58517.81538729,   0.00268329, -0.27769418)
        return Planet(orbitalElements: elems, orbitalRates: rates)
    }
    
    public static var mars: Planet {
        let elems = KeplerianElements(1.52371034, 0.09339410,  1.84969142,    -4.55343205, -23.94362959, 49.55953891)
        let rates = KeplerianElements(0.00001847, 0.00007882, -0.00813131, 19140.30268499,   0.44441088, -0.29257343)
        return Planet(orbitalElements: elems, orbitalRates: rates)
    }
    
    public static var jupiter: Planet {
        let elems = KeplerianElements( 5.20288700,  0.04838624,  1.30439695,   34.39644051, 14.72847983, 100.47390909)
        let rates = KeplerianElements(-0.00011607, -0.00013253, -0.00183714, 3034.74612775,  0.21252668,   0.20469106)
        return Planet(orbitalElements: elems, orbitalRates: rates)
    }
    
    public static var saturn: Planet {
        let elems = KeplerianElements( 9.53667594,  0.05386179, 2.48599187,   49.95424423, 92.59887831, 113.66242448)
        let rates = KeplerianElements(-0.00125060, -0.00050991, 0.00193609, 1222.49362201, -0.41897216,  -0.28867794)
        return Planet(orbitalElements: elems, orbitalRates: rates)
    }
    
    public static var uranus: Planet {
        let elems = KeplerianElements(19.18916464,  0.04725744,  0.77263783, 313.23810451, 170.95427630, 74.01692503)
        let rates = KeplerianElements(-0.00196176, -0.00004397, -0.00242939, 428.48202785,   0.40805281,  0.04240589)
        return Planet(orbitalElements: elems, orbitalRates: rates)
    }
    
    public static var neptune: Planet {
        let elems = KeplerianElements(30.06992276, 0.00859048, 1.77004347, -55.12002969, 44.96476227, 131.78422574)
        let rates = KeplerianElements( 0.00026291, 0.00005105, 0.00035372, 218.45945325, -0.32241464,  -0.00508664)
        return Planet(orbitalElements: elems, orbitalRates: rates)
    }
}
