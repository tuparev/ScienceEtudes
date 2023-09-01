//
//  File.swift
//  
//
//  Created by Georg Tuparev on 22/07/2022.
//

import Foundation

public class Unit: Codable {
    public internal(set) var dimension: Dimension?
    public internal(set) var symbol: String     // e.g. kg, m. s, ...

    public init?(symbol: String, dimension: Dimension? = nil) {
        if symbol.isEmpty { return nil }
        
        self.symbol    = symbol
        self.dimension = dimension
    }

}
