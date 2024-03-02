//
//  MagnetometerSensor.swift
//
//
//  Created by Thomas Quinto on 2/28/24.
//

import Foundation
import CoreMotion

class MagnetometerSensor: IosSensor {
    
    override func doesSensorExist() -> Bool {
        return self.motionManager.isMagnetometerAvailable
    }
    
    override func valuesCount() -> Int {
        return 3
    }
    
    override func startListening(listener: @escaping ([Double]) -> Void) {
        if (doesSensorExist()) {
            self.motionManager.startMagnetometerUpdates(to: self.queue) { (data: CMMagnetometerData?, error: Error?) in
                if let myData = data {
                    listener([myData.magneticField.x,
                              myData.magneticField.y,
                              myData.magneticField.z])
                }
            }
        }
    }
    
    override func stopListening() {
        if (doesSensorExist()) {
            self.motionManager.stopMagnetometerUpdates()
        }
    }

}
