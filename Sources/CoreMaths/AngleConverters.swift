//
//  AngleConverters.swift
//  
//
//  Created by Hunter Holland on 16.03.23.
//  Copyright © See Framework's LICENSE file
//

import Foundation

func deg2rad<T: BinaryFloatingPoint>(_ degrees: T) -> T { degrees * T.pi / 180 }

func rad2deg<T: BinaryFloatingPoint>(_ radians: T) -> T { radians * 180 / T.pi }
