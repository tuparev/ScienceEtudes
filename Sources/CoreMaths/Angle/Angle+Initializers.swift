//
//  Angle+Initializers.swift
//  swift-astronomy
//
//  Created by Hunter Holland on 12/28/22.
//

import Foundation

public extension Angle {
    init(degrees: Double, type: AngleType = .basic) {
        if let validRange = type.validRange {
            self.value = degrees.wrap(into: validRange)
        } else {
            self.value = degrees
        }
        self.type = type
    }
    
    init(radians: Double, type: AngleType = .basic) {
        self.init(degrees: rad2deg(radians), type: type)
    }
    
    init(degree d: Double = 0, arcminute m: Double = 0, arcsecond s: Double = 0, type: AngleType = .latitude) {
        self.init(value: Self.toDegrees(degree: d, arcminute: m, arcsecond: s), type: type)
    }
    
    init(hour h: Double = 0, minute m: Double = 0, second s: Double = 0, type: AngleType = .longitude) {
        self.init(value: Self.toDegrees(hour: h, minute: m, second: s), type: type)
    }
}

public extension Angle {
    init?(_ string: String, type: AngleType = .basic) {
        let parser = Parser()
        if let degrees = parser.parse(string) {
            self.init(degrees: degrees, type: type)
        } else {
            return nil
        }
    }
    
    internal struct Parser {
        
        func parse(_ input: String) -> Double? {
            var angleValue: Double? = nil
            for parseMethod in [checkDMS, checkHMS] {
                if let parseResult = parseMethod(input) {
                    angleValue = parseResult
                }
            }
            return angleValue
        }
        
        func checkDMS(_ input: String) -> Double? {
            // Ex: "+9d15m3.50s", "9deg 15min 3.50sec W", "-9º15'3.5"W"
            let regex = #/
            ^(?<sign>[+-]?)
            ((?<d>\d+)(d|deg|º)([: ]*))?
            ((?<m>\d+)(m|min|')?([: ]*))?
            ((?<s>\d+(\.\d+)?)(s|sec|")?([: ]*))?
            (?<dir>[NSEW])?$
            /#
            
            let match = input.wholeMatch(of: regex)
            
            guard let match = match else { return nil }
            
            let sign: FloatingPointSign = match.sign == "-" ? .minus : .plus
            let d, m, s: Double
                        
            if let string = match.d, let degrees = Double(string) { d = degrees }
            else { d = 0 }
            
            if let string = match.m, let minutes = Double(string) { m = minutes }
            else { m = 0 }
            
            if let string = match.s, let seconds = Double(string) { s = seconds }
            else { s = 0 }
            
            let value = Angle.toDegrees(sign: sign,
                                        degree: d,
                                        arcminute: m,
                                        arcsecond: s)
            
            return value
        }
        
        func checkHMS(_ input: String) -> Double? {
            // Ex: "1h2m3.40s", "1h 20 3", "1hrs 15min 3sec W"
            let regex = #/
            ^(?<sign>[+-]?)
            ((?<h>\d+)(h|hrs)([: ]*))?
            ((?<m>\d+)(m|min|')?([: ]*))?
            ((?<s>\d+(\.\d+)?)(s|sec|")?([: ]*))?
            (?<dir>[NSEW])?$
            /#
            
            let match = input.wholeMatch(of: regex)
            
            guard let match = match else { return nil }
            
            let sign: FloatingPointSign = match.sign == "-" ? .minus : .plus
            let h, m, s: Double
            
            if let string = match.h, let hours = Double(string) { h = hours }
            else { h = 0 }
            
            if let string = match.m, let minutes = Double(string) { m = minutes }
            else { m = 0 }
            
            if let string = match.s, let seconds = Double(string) { s = seconds }
            else { s = 0 }
            
            let value = Angle.toDegrees(sign: sign,
                                        hour: h,
                                        minute: m,
                                        second: s)
            
            return value
        }
    }
}
