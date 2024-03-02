//
//  IosSensor.swift
//
//
//  Created by Thomas Quinto on 2/28/24.
//

import Foundation
import CoreMotion

class IosSensor: MeasurableSensor {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    // setup motion manager and queue for subclasses to access
    internal let motionManager = CMMotionManager()
    internal let queue = OperationQueue()
    
    func doesSensorExist() -> Bool {
        return false
    }
    
    func valuesCount() -> Int {
        return -1
    }
    
    func startListening(listener: @escaping ([Double]) -> Void) {
        
    }
    
    func stopListening() {
        
    }
    
}
