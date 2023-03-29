//
//  GeographicCoordinate+SiderealTime.swift
//  
//
//  Created by Hunter Holland on 3/23/23.
//

import Foundation
import CoreMaths
import Time

extension GeographicCoordinate {
    func siderealTime(_ type: SiderealTime) -> Angle {
        self.time.siderealTime(type) - self.longitude
    }
}
