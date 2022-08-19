//
//  Sensor.swift
//  
//
//  Created by Georg Tuparev on 12/08/2022.
//

import Foundation

public enum SensorType: String, Codable {
    // General
    case temperature
    case pressure

    // Weather
    case humidity
    case windSpeed
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
    case voltMeter
}

public typealias PercentageAccuracy = Double

public class SensorDescription<ValueType: Measurable>: Codable {
    public var type: SensorType

    public var name: String?
    public var description: String?

    public var minValue: ValueType?
    public var maxValue: ValueType?
    public var accuracy: PercentageAccuracy?
    public var units: Unit
    public var measurementFrequency: Measurement<Double>?

    public init(type: SensorType,
                name: String?                              = nil,
                description: String?                       = nil,
                minValue: ValueType?                       = nil,
                maxValue: ValueType?                       = nil,
                accuracy: PercentageAccuracy?              = nil,
                units: Unit,
                measurementFrequency: Measurement<Double>? = nil) {
        self.type                 = type
        self.name                 = name
        self.description          = description
        self.minValue             = minValue
        self.maxValue             = maxValue
        self.accuracy             = accuracy
        self.units                = units
        self.measurementFrequency = measurementFrequency
    }
}

public struct SensorMeasurement<ValueType: Measurable>: Codable {
    public let sensorReference: SensorDescription<ValueType>
    public var currentValue: Measurement<ValueType>?
}


//MARK: - Making types Codable and CustomStringConvertible -

public extension SensorType {
    enum CodingKeys: String, CodingKey {
        // General
        case temperature
        case pressure

        // Weather
        case humidity
        case windSpeed     = "wind_speed"
        case windDirection = "wind_direction"
        case rainfall
        case dust
        case cloudMonitor  = "cloud_monitor"

        // Light
        case light
        case uvIndex       = "uv_index"
        case ccdCamera     = "ccd_camera"
        case cmosCamera    = "cmos_camera"
        case webCam        = "web_cam"

        // Electricity
        case voltMeter     = "volt_meter"
    }
}

public extension SensorDescription {
    enum CodingKeys: String, CodingKey {
        case type
        case name
        case description
        case minValue             = "min_value"
        case maxValue             = "max_value"
        case accuracy
        case units
        case measurementFrequency = "measurement_frequency"
    }
}
