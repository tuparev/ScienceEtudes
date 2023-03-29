//
//  Angle+.swift
//  swift-astronomy
//
//  Created by Hunter Holland on 12/28/22.
//

extension Angle: AdditiveArithmetic {
    public static var zero: Self {
        Angle(value: 0, type: .basic)
    }

    public static func + (lhs: Self, rhs: Self) -> Self {
        Angle(value: lhs.value + rhs.value, type: lhs.type)
    }

    public static func - (lhs: Self, rhs: Self) -> Self {
        Angle(value: lhs.value - rhs.value, type: lhs.type)
    }
}
