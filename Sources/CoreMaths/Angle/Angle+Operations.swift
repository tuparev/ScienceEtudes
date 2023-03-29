//
//  Angle+Operations.swift
//  swift-astronomy
//
//  Created by Hunter Holland on 12/31/22.
//

public extension Angle {
    // MARK: Out of Place
    static func + (lhs: Self, rhs: Double) -> Self { Angle(value: lhs.value + rhs, type: lhs.type) }
    
    static func + (lhs: Double, rhs: Self) -> Self { rhs + lhs }
    
    static func - (lhs: Self, rhs: Double) -> Self { Angle(value: lhs.value - rhs, type: lhs.type) }
    
    static func - (lhs: Double, rhs: Self) -> Self { rhs - lhs }
    
    static func * (lhs: Self, rhs: Double) -> Self { Angle(value: lhs.value * rhs, type: lhs.type) }
    
    static func * (lhs: Double, rhs: Self) -> Self { rhs * lhs }
    
    static func / (lhs: Self, rhs: Double) -> Self { Angle(value: lhs.value / rhs, type: lhs.type) }
    
    // MARK: In Place
    static func += (lhs: inout Self, rhs: Double) { lhs.value += rhs }

    static func -= (lhs: inout Self, rhs: Double) { lhs.value -= rhs }

    static func *= (lhs: inout Self, rhs: Double) { lhs.value *= rhs }

    static func /= (lhs: inout Self, rhs: Double) { lhs.value /= rhs }
}
