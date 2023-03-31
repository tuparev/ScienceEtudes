//
//  Utilities.swift
//  
//
//  Created by Hunter Holland on 12/28/22.
//

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
