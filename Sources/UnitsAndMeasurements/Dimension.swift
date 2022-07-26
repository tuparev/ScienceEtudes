//
//  Dimension.swift
//  
//
//  Created by Georg Tuparev on 26/07/2022.
//

import Foundation

struct Dimension: Codable {
    var name: String       // e.g. Length, Area, Mass, Density, Time, ...
    var descriptor: String // e.g. L,      L^2,  M,    M/L^3,   T,    ...
}
