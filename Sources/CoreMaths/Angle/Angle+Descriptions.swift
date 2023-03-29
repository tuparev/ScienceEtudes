//
//  Angle+Descriptions.swift
//  swift-astronomy
//
//  Created by Hunter Holland on 12/28/22.
//

import Foundation

extension Angle: CustomStringConvertible {
    /// A textual representation of this instance.
    public var description: String {
        String(format: "Angle: %.3fº", self.degrees)
    }
}
