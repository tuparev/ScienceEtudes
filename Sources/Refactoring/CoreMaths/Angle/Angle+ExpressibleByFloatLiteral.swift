//
//  Angle+ExpressibleByFloatLiteral.swift
//  swift-astronomy
//
//  Created by Hunter Holland on 12/30/22.
//

extension Angle: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self.init(degrees: value)
    }
}
