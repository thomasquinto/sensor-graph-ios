//
//  File.swift
//  
//
//  Created by Thomas Quinto on 2/28/24.
//

import Foundation

var sensors: [MeasurableSensor] = [
    AccelerometorSensor(name: "Accelerometer"),
    DeviceMotionSensor(name: "Device Motion"),
    GyroSensor(name: "Gyroscope"),
    MagnetometerSensor(name: "Magnetometer")
]
