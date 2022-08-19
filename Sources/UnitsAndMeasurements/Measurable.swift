//
//  File.swift
//  
//
//  Created by Georg Tuparev on 24/07/2022.
//

import Foundation

public protocol Measurable: Codable { }

extension Int: Measurable    { }
extension Int8: Measurable   { }
extension Int16: Measurable  { }
extension Int32: Measurable  { }
extension Int64: Measurable  { }

extension UInt: Measurable   { }
extension UInt8: Measurable  { }
extension UInt16: Measurable { }
extension UInt32: Measurable { }
extension UInt64: Measurable { }

extension Float: Measurable  { }

extension Double: Measurable { }
