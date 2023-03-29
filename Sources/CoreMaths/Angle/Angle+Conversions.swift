//
//  Angle+Conversions.swift
//  swift-astronomy
//
//  Created by Hunter Holland on 12/29/22.
//

public extension Angle {
    static func toDegrees<T: BinaryFloatingPoint>(sign: FloatingPointSign = .plus,
                                                  degree: T = 0,
                                                  arcminute: T = 0,
                                                  arcsecond: T = 0) -> T {
        let value = degree + (arcminute / 60) + (arcsecond / 3600)
        return sign == .plus ? value : -value
    }
    
    static func toDegrees<T: BinaryFloatingPoint>(sign: FloatingPointSign = .plus,
                                                  hour: T = 0,
                                                  minute: T = 0,
                                                  second: T = 0) -> T {
        return Self.toDegrees(sign: sign,
                              degree: hour * 15,
                              arcminute: minute * 15,
                              arcsecond: second * 15)
    }
    
    static func toRadians<T: BinaryFloatingPoint>(sign: FloatingPointSign = .plus,
                                                  degree: T = 0,
                                                  arcminute: T = 0,
                                                  arcsecond: T = 0) -> T {
        let degrees = Self.toDegrees(sign: sign,
                                     degree: degree,
                                     arcminute: arcminute,
                                     arcsecond: arcsecond)
        return deg2rad(degrees)
    }
    
    static func toRadians<T: BinaryFloatingPoint>(sign: FloatingPointSign = .plus,
                                                  hour: T = 0,
                                                  minute: T = 0,
                                                  second: T = 0) -> T {
        return Self.toRadians(sign: sign,
                              degree: hour * 15,
                              arcminute: minute * 15,
                              arcsecond: second * 15)
    }
    
    static func toDMS(degree: Double) -> DMSTuple {
        let d = Int(degree)
        
        var minutes = degree.truncatingRemainder(dividingBy: 1) * 60
        if minutes < 0 { minutes *= -1 }
        let m = Int(minutes)
        
        let seconds = minutes.truncatingRemainder(dividingBy: 1) * 60
        
        return (d, m, seconds)
    }
    
    static func toHMS(degree: Double) -> HMSTuple {
        let hours = degree / 15
        let h = Int(hours)
        
        var minutes = hours.truncatingRemainder(dividingBy: 1) * 60
        if minutes < 0 { minutes *= -1 }
        let m = Int(minutes)
        
        let seconds = minutes.truncatingRemainder(dividingBy: 1) * 60
        
        return (h, m, seconds)
    }
}

func deg2rad<T: BinaryFloatingPoint>(_ degrees: T) -> T { degrees * T.pi / 180 }

func rad2deg<T: BinaryFloatingPoint>(_ radians: T) -> T { radians * 180 / T.pi }
