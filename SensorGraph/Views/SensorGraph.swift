//
//  SwiftUIView.swift
//  
//
//  Created by Thomas Quinto on 2/28/24.
//

import SwiftUI
import SwiftUICharts

struct SensorGraph: View {
    private let sensor: MeasurableSensor
    @State private var data: [([Double],GradientColor)]
    private let maxArraySize = 200
    private let gradients = [GradientColors.green,
                             GradientColors.purple,
                             GradientColors.orange]
    
    init(sensor: MeasurableSensor) {
        self.sensor = sensor
        
        var dataInitialValue: [([Double],GradientColor)] = [([Double],GradientColor)](repeating: ([Double](),gradients[0]), count: self.sensor.valuesCount())
        for i in 0..<self.sensor.valuesCount() {
            dataInitialValue[i].1 = gradients[i]
        }
        
        _data = State(initialValue: dataInitialValue);
    }
        
    var body: some View {
        VStack {
            MultiLineChartView(data: data,
                               title: sensor.name,
                               form: ChartForm.extraLarge,
                               dropShadow: false
            ).padding(5)
        }
        .onAppear {
            sensor.startListening() { values in
                for i in 0..<values.count {
                    var stateValues = data[i].0
                    stateValues.append(values[i])
                    while (stateValues.count >= maxArraySize) {
                        stateValues.remove(at: 0)
                    }
                    data[i] = (stateValues, gradients[i])
                }
            }
        }
        .onDisappear {
            sensor.stopListening()
        }
    }
}

#Preview {
    SensorGraph(sensor: DeviceMotionSensor(name: "Device Motion"))
}
