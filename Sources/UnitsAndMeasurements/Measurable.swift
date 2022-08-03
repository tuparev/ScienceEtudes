//
//  Measurable.swift
//  
//
//  Created by Georg Tuparev on 24/07/2022.
//

import Foundation

public protocol Measurable: Codable { }

extension Int: Measurable { }

extension Float: Measurable { }

extension Double: Measurable { }
