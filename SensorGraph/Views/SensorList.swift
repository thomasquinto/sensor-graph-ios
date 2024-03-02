//
//  SensorList.swift
//  
//
//  Created by Thomas Quinto on 2/28/24.
//

import SwiftUI

struct SensorList: View {
    var body: some View {
        NavigationSplitView {
            List(sensors, id: \.name) { sensor in
                NavigationLink {
                    SensorGraph(sensor: sensor)
                } label: {
                    SensorRow(sensor: sensor)
                }
            }
            .navigationTitle("Sensors")
        } detail: {
            Text("Select a Sensor")
        }
    }
}

#Preview {
    SensorList()
}
