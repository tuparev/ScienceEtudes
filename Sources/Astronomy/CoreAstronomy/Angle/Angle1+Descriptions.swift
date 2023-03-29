//
//  Angle+Descriptions.swift
//
//
//  Created by Hunter Holland on 12/28/22.
//

import Foundation
import CoreMaths

extension Angle {
    /// A textual representation of this instance.
    public var description: String {
        switch self.type {
        case .longitude:
            return try! self.toString(.hms())
        case .latitude:
            return try! self.toString(.dms())
        default:
            return String(format: "Angle: %.3fº", self.degrees)
        }
    }
    
    func toString(_ format: StringFormat) throws -> String {
        return try format.formDescription(self.degrees)
    }
}

extension Angle {
    internal enum StringFormat {
        case dms(separator: String = "dms")
        case hms(separator: String = "hms")
        
        func formDescription(_ degrees: Double) throws -> String {
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 6
            
            var description = ""
            switch self {
            case .dms(let sep):
                guard sep.count == 3 else {
                    throw AngleError.invalidSeparatorLength(length: sep.count)
                }
                let t = Angle.toDMS(degree: degrees)
                
                description += "\(t.degree)\(sep[0])"
                description += "\(t.arcminute)\(sep[1])"
                description += "\(formatter.string(for: t.arcsecond)!)\(sep[2])"
            case .hms(let sep):
                guard sep.count == 3 else {
                    throw AngleError.invalidSeparatorLength(length: sep.count)
                }
                let t = Angle.toHMS(degree: degrees)
                
                description += "\(t.hour)\(sep[0])"
                description += "\(t.minute)\(sep[1])"
                description += "\(formatter.string(for: t.second)!)\(sep[2])"
            }
            return description
        }
    }
}
