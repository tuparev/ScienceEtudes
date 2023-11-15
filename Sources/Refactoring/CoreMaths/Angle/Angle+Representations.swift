//
//  Angle+Representations.swift
//  swift-astronomy
//
//  Created by Hunter Holland on 12/28/22.
//

public extension Angle {
    typealias HMSTuple = (hour: Int, minute: Int, second: Double)
    typealias DMSTuple = (degree: Int, arcminute: Int, arcsecond: Double)
    
    /// The angle's value in radians.
    var radians: Double { deg2rad(self.degrees) }
    
    /// The angle's value in degrees.
    var degrees: Double { self.value }
    
    /// The angle's value in hours.
    var hours: Double { self.degrees / 15 }
    
    /// The angle's value in arcminutes.
    var arcminutes: Double { self.hours * 60 }
    
    /// The angle's value in arcseconds.
    var arcseconds: Double { self.hours * 60 * 60 }
    
    /// The angle’s value in degree-minute-second sexagesimal units.
    var dms: DMSTuple { Self.toDMS(degree: self.degrees) }
    
    /// The angle’s value in hour-minute-second sexagesimal units.
    var hms: HMSTuple { Self.toHMS(degree: self.degrees) }
}
