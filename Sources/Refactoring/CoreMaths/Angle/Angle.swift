//
//  Angle.swift
//  swift-astronomy
//
//  Created by Hunter Holland on 12/28/22.
//

import Foundation

public struct Angle {
    /// The value of the angle in degrees.
    internal var value: Double {
        didSet {
            if let validRange {
                value = value.wrap(into: validRange)
            }
        }
    }

    /// The type of angle.
    ///
    /// This variable is be used to determine the wrap angle and the preferred description.
    public let type: AngleType

    public enum AngleType {
        case latitude
        case longitude
        case basic
    }
}
