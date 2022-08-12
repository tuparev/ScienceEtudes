//
//  Sensor.swift
//  
//
//  Created by Georg Tuparev on 12/08/2022.
//

import Foundation

public enum SensorType: Codable {
    // General
    case temperature
    case pressure

    // Weather
    case humidity
    case windspeed
    case windDirection
    case rainfall
    case dust
    case cloudMonitor

    // Light
    case light
    case uvIndex
    case ccdCamera
    case cmosCamera
    case webCam

    // Electricity

}

public class SensorDescription: Codable {
    public var type: SensorType

    public var naem: String?
    public var description: String?

    public var minValue: Double?
    public var maxValue: Double?
    public var precision: Double?  //TODO: Fix this!
    public var units: Unit
    public var measurementFrequency: Measurement<Double>?
}

public struct SensorMeasurement: Codable {
    public let sensorReference: SensorDescription
    public var currentValue: Measurement<Double>?
}
