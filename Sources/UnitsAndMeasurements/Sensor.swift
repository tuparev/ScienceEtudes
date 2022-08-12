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
