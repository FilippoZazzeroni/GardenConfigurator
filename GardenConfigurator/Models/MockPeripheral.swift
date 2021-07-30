//
//  File.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 22/06/21.
//

import Foundation
import CoreBluetooth




/// mock bluetooth pheripheral
class MockPeripheral: Identifiable {
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    
    let id: Int
    
    /// returns [mockState]
    var state: CBPeripheralState = .disconnected
    
    /// override of the [CBPeripheral] name getter returns [mockName]
    let name: String
    
}

