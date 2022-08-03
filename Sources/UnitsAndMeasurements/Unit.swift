//
//  Unit.swift
//  
//
//  Created by Georg Tuparev on 22/07/2022.
//

import Foundation

public struct Unit: Codable {
    public internal(set) var dimension: String
    public internal(set) var symbol: String

    public init?(symbol: String) {
        if symbol.isEmpty { return nil }
        
        self.symbol    = symbol
        self.dimension = "<<Unknown>>"
    }

}
