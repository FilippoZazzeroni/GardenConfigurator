//
//  File.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 22/06/21.
//

import Foundation
import CoreBluetooth


/// mock bluetooth pheripheral
class MockPeripheral: CBPeripheral {
    
    /// returns [mockState]
    override var state: CBPeripheralState { return mockState }
    
    private let mockName: String
    
    private var mockState: CBPeripheralState
    
    /// override of the [CBPeripheral] name getter returns [mockName]
    override var name: String { return mockName }
    
    init(name: String, state: CBPeripheralState) {
        self.mockName = name
        self.mockState = state
    }
}
