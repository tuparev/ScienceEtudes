//
//  Angle+Errors.swift
//  swift-astronomy
//
//  Created by Hunter Holland on 12/29/22.
//

public enum AngleError: Error, CustomStringConvertible {
    case cannotParseString(_ string: String)
    case invalidSeparatorLength(length: Int)
    
    public var description: String {
        switch self {
        case .cannotParseString(let angleString):
            return "Cannot parse angle \"\(angleString).\""
        case .invalidSeparatorLength(let length):
            return "3 separators must be provided, not \(length)."
        }
    }
}
