//
//  Angle+Wrapping.swift
//  swift-astronomy
//
//  Created by Hunter Holland on 2/23/23.
//

import Foundation

//extension Angle.AngleType {
//    var validRange: (any BoundedRange<Double>)? {
//        switch self {
//        case .declination, .altitude, .eclipticLatitude, .galacticLatitude, .geographicLatitude:
//            return -90...90
//        case .rightAscension, .azimuth, .eclipticLongitude, .galacticLongitude, .earthRotation:
//            return 0..<360
//        case .geographicLongitude:
//            return -180..<180
//        case .other:
//            return nil
//        }
//    }
//}

extension Angle.AngleType {
    var validRange: (any BoundedRange<Double>)? {
        switch self {
        case .latitude:
            return -90...90
        case .longitude:
            return 0..<360
        case .basic:
            return nil
        }
    }
}

extension Angle {
    var validRange: (any BoundedRange<Double>)? {
        type.validRange
    }
}

public extension Angle {
    func wrap(into range: any BoundedRange<Double>) -> Self {
        return Angle(value: value.wrap(into: range), type: type)
    }
}

public extension BinaryFloatingPoint {
    /// Returns the current value wrapped to within the given range.
    ///
    /// Given a continuous range of values from  `x` to `y`, this method forces the current number `n` into either
    /// the range `[x, y)` or `[x, y]`, depending on the type of range passed as input.
    func wrap(into range: any BoundedRange<Self>) -> Self {
        guard !range.contains(self) else { return self }
        
        let min = range.lowerBound, max = range.upperBound
        let span = max - min
        
        var newValue = (self + max).remainder(dividingBy: span)
        if (newValue < 0) { newValue += span }
        
        return newValue + min
    }
}

// MARK: BoundedRange
/// An interval with defined lower and upper bounds.
public protocol BoundedRange<Bound>: RangeExpression where Bound : Comparable {
    var lowerBound: Bound { get }
    var upperBound: Bound { get }
}

extension Range: BoundedRange { }

extension ClosedRange: BoundedRange { }
