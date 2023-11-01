//===----------------------------------------------------------------------===//
//  AstronomicalTime.swift
//===----------------------------------------------------------------------===//
//
// This source file is part of the ScienceEtudes open source project
//
// Copyright (c) 2021-2023 Tuparev Technologies and the ScienceEtudes project
// authors.
// Licensed under MIT License Modern Variant
//
// See LICENSE for license information
// See CONTRIBUTORS.md for the list of ASTRO-POLIS project authors
//
// SPDX-License-Identifier: MIT-Modern-Variant
//
//===----------------------------------------------------------------------===//

import Foundation

/// `AstronomicalTime` represent different times frequently used in Astronomy.
public struct AstronomicalTime {

    public init(utcTime: Date? = nil, earthTimeZoneIdentifier: String? = nil) {
        if let time = utcTime { self.initialTime = time}
        else                  { self.initialTime = utcTime! }
        self.earthTimeZoneIdentifier = earthTimeZoneIdentifier
    }

    /// Creates a new `AstronomicalTime` from a `JulianDay`
    ///
    /// - Parameter julianDay: should be a positive ``Double``
    @inlinable public init(julianDay: Double) {
        precondition(julianDay >= 0, "Julian Dates must be positive.")

        let epochSeconds = round((julianDay - 2_440_587.5) * 86400)
        self.init(utcTime: Date(timeIntervalSince1970: epochSeconds))
    }

    private let initialTime: Date
    private let earthTimeZoneIdentifier: String?
}

