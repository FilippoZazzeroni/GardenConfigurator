//
//  BLEmanager.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 16/04/21.
//

import Foundation
import CoreBluetooth
import Combine

class BleContoller: NSObject, CBCentralManagerDelegate {
    
    // se inizializzo le variabili di classe come globali allora le devo indicare come ?, se swift le intende come se le dovessi inizializzare dall'init
    override init() {
        super.init()
        self.manager = CBCentralManager.init(delegate: self, queue: nil)
        self.onDiscoverSubject = PassthroughSubject<[CBPeripheral], Never>()
        self.onDiscoverPublisher = onDiscoverSubject!.eraseToAnyPublisher()
    }
    
    private var manager: CBCentralManager?
    
    private var devices: [CBPeripheral] = []
    
    // subject that delivers event to subscribers
    private var onDiscoverSubject: PassthroughSubject<[CBPeripheral], Never>?
    
    var onDiscoverPublisher: AnyPublisher<[CBPeripheral], Never>?
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        let device = peripheral
        if devices.contains(device) == false {
            devices.append(device)
        }
        // emit event with devices
        self.onDiscoverSubject?.send(self.devices)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        manager = central
    }
    
    func scanPeriphelars() {
        devices.removeAll()
        if manager != nil {
            manager?.scanForPeripherals(withServices: nil, options: nil)
        }
    }
    
    
    
}


extension CBPeripheral: Identifiable {
        
    /// return string of the connection state of pheripheral
    func getConnectionStateString() -> String {
        switch self.state {
        case .connected:
            return "Connected"
        case .disconnected:
            return "Disconnected"
        case .connecting:
            return "Connecting"
        case .disconnecting:
            return "Disconnetcing"
        default:
            return "Unknown"
        }
    }
    
}
