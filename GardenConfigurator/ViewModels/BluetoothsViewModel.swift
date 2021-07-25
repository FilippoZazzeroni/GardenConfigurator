//
//  BluetoothViewModel.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 16/04/21.
//

import Foundation
import CoreBluetooth
import Combine


class BluetoothsViewModel: ObservableObject {
    
    @Published var devices: [CBPeripheral] = []
    
    /// selcted device from list of [devices] used to track sheet changes
    @Published var selectedDevice: CBPeripheral?
    
    private let bleController: BleContoller
    
    private var subscription: AnyCancellable?
    
    init(bleController: BleContoller) {
        
        self.bleController = bleController
        
        // mock devices 
        for i in 1...3 {
            self.devices.append(MockPeripheral(name: "Test\(i)", state: .disconnected))
        }
        // mi metto in ascolto dell aggiornamento sui devices
        self.subscription = self.bleController.onDiscoverPublisher?.sink(receiveValue: { devices in
            self.devices = devices
        })
    }
    
    deinit {
        self.subscription?.cancel()
    }
    
    func scan() {
        devices.removeAll()
        bleController.scanPeriphelars()
    }
    
}
