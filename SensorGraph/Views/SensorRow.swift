//
//  SensorRow.swift
//  
//
//  Created by Thomas Quinto on 2/28/24.
//

import SwiftUI

struct SensorRow: View {
    
    var sensor: MeasurableSensor;
    
    var body: some View {
        HStack {
            Text(sensor.name).padding(5)
            Spacer()
        }
    }
}

#Preview {
    return Group {
        SensorRow(sensor: GyroSensor(name: "Gyro"))
        SensorRow(sensor: GyroSensor(name: "Gyro"))
        SensorRow(sensor: GyroSensor(name: "Gyro"))
        SensorRow(sensor: GyroSensor(name: "Gyro"))
    }
}
