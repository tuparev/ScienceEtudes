//
//  File.swift
//  
//
//  Created by Georg Tuparev on 24/07/2022.
//

import Foundation

public struct Measurement<ValueType: Measurable>: Codable {
    public let value: ValueType
    public let unit: Unit

    public init?(value: ValueType, symbol: String) {
        guard let unit = Unit(symbol: symbol) else { return nil }

        self.value = value
        self.unit  = unit
    }

}
