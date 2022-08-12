//
//  File.swift
//  
//
//  Created by Georg Tuparev on 24/07/2022.
//

import Foundation

public protocol MeasurementSupporting: Codable {
    associatedtype Value: Measurable

    var value: Value { get }
    var unit: Unit   { get }
    var time: Date?  { get }
}

public struct Measurement<ValueType : Measurable>: MeasurementSupporting {
    public let value: ValueType
    public let unit: Unit
    public let time: Date?

    public init?(value: ValueType, symbol: String, time: Date? = nil) {
        guard let unit = Unit(symbol: symbol) else { return nil }

        self.value = value
        self.unit  = unit
        self.time  = time
    }
}
