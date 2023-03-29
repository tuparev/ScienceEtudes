//===----------------------------------------------------------------------===//
//
//  This source file is part of the Swift Astronomy open source project.
//
//  Created by Hunter Holland on 12/28/22.
//
//===----------------------------------------------------------------------===//


extension Angle: Equatable {
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Two angles are considered equal if they represent the same radian value.
    public static func == (lhs: Angle, rhs: Angle) -> Bool {
        lhs.value == rhs.value
    }
}
