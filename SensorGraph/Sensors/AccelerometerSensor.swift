//
//  AccelerometorSensor.swift
//
//
//  Created by Thomas Quinto on 2/28/24.
//

import Foundation
import CoreMotion

class AccelerometorSensor: IosSensor {
    
    override func doesSensorExist() -> Bool {
        return self.motionManager.isAccelerometerAvailable
    }
    
    override func valuesCount() -> Int {
        return 3
    }
    
    override func startListening(listener: @escaping ([Double]) -> Void) {
        if (doesSensorExist()) {
            self.motionManager.startAccelerometerUpdates(to: self.queue) { (data: CMAccelerometerData?, error: Error?) in
                if let myData = data {
                    listener([myData.acceleration.x,
                              myData.acceleration.y,
                              myData.acceleration.z])
                }
            }
        }
    }
    
    override func stopListening() {
        if (doesSensorExist()) {
            self.motionManager.stopAccelerometerUpdates()
        }
    }

}
