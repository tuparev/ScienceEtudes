//
//  Dimension.swift
//  
//
//  Created by Georg Tuparev on 26/07/2022.
//  Copyright © See Framework's LICENSE file
//

import Foundation

// Base Units in SI:
// Measure                Name        Symbol Dimension symbol
// Length                 metre       m      L
// Mass                   kilogram    kg     M
// Time                   second      s      T
// Temperature            kelvin      K      Θ
// Electric current       ampere      A      I
// Amount of substance    mole        mol    N
// Luminous intensity     candela     cd     J
// Link: https://en.wikipedia.org/wiki/SI_base_unit

public class Dimension: Codable {
    var measure: String         // e.g. Length, Area, Mass, Density, Time, ...
    var dimensionSymbol: String // e.g. L,      L^2,  M,    M/L^3,   T,    ...
}
