//
//  Angle+Comparable.swift
//  swift-astronomy
//
//  Created by Hunter Holland on 12/28/22.
//

extension Angle: Comparable {
    public static func < (lhs: Angle, rhs: Angle) -> Bool {
        lhs.value < rhs.value
    }
}
