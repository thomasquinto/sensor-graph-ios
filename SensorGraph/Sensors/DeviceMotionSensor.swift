//
//  DeviceMotionSensor.swift
//
//
//  Created by Thomas Quinto on 2/28/24.
//

import Foundation
import CoreMotion

class DeviceMotionSensor: IosSensor {
    
    override func doesSensorExist() -> Bool {
        return self.motionManager.isDeviceMotionAvailable
    }
    
    override func valuesCount() -> Int {
        return 3
    }
    
    override func startListening(listener: @escaping ([Double]) -> Void) {
        if (doesSensorExist()) {            
            self.motionManager.startDeviceMotionUpdates(to: self.queue) { (data: CMDeviceMotion?, error: Error?) in
                if let myData = data {
                    listener([myData.attitude.roll,
                              myData.attitude.pitch,
                              myData.attitude.yaw])
                }
            }
        }
    }
    
    override func stopListening() {
        self.motionManager.stopDeviceMotionUpdates()
    }

}
