//
//  File.swift
//  
//
//  Created by Thomas Quinto on 2/27/24.
//

import Foundation

protocol MeasurableSensor {
    
    var name: String {get}
    
    func doesSensorExist() -> Bool
    
    func valuesCount() -> Int
    
    func startListening(listener: @escaping ([Double]) -> Void)
    
    func stopListening()

}
