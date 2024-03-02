//
//  GyroSensor.swift
//  
//
//  Created by Thomas Quinto on 2/28/24.
//

import Foundation
import CoreMotion

class GyroSensor: IosSensor {
    
    override func doesSensorExist() -> Bool {
        return self.motionManager.isGyroAvailable
    }
    
    override func valuesCount() -> Int {
        return 3
    }
    
    override func startListening(listener: @escaping ([Double]) -> Void) {
        if (doesSensorExist()) {
            self.motionManager.startGyroUpdates(to: self.queue) { (data: CMGyroData?, error: Error?) in
                if let myData = data {
                    listener([myData.rotationRate.x,
                              myData.rotationRate.y,
                              myData.rotationRate.z])
                }
            }
        }
    }
    
    override func stopListening() {
        if (doesSensorExist()) {
            self.motionManager.stopGyroUpdates()
        }
    }

}
