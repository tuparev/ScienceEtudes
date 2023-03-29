//
//  Angle+Strideable.swift
//  swift-astronomy
//
//  Created by Hunter Holland on 12/30/22.
//

extension Angle: Strideable {
    public func distance(to other: Angle) -> Double {
        return other.value - self.value
    }
    
    public func advanced(by n: Double) -> Angle {
        Angle(value: self.value + n, type: self.type)
    }
}
