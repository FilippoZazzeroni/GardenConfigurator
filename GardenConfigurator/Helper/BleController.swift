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
    
    #warning("da implementare")
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("empty")
    }
    
    #warning("da implementare")
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("empty")
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        manager = central
    }
    
    /**
     - Parameters:
     - isMock: true means it is a mocck state
     - peripheral: device to connect
     */
    #warning("TODO Da refattorizzare correttamente")
    func connect(peripheral: CBPeripheral?, mockPeripheral: MockPeripheral?, isMock: Bool = false) -> Any {
        if isMock {
            
            mockPeripheral!.state = .connected
            
            return mockPeripheral!
        } else {
            #warning("da implementare")
            return "To be implemented"
        }
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
