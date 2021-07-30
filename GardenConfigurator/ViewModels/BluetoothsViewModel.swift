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
    
    @Published var devices: [MockPeripheral] = []
    
    /// selcted device from list of [devices] used to track sheet changes
    @Published var selectedDevice: MockPeripheral?
    
    private let bleController: BleContoller
    
    private var subscription: AnyCancellable?
    
    init(bleController: BleContoller) {
        
        self.bleController = bleController
        
        // mock devices 
        for i in 1...4 {
            self.devices.append(MockPeripheral(name: "Test\(i)", id: i))
        }
        // mi metto in ascolto dell aggiornamento sui devices
        #warning("TODO add in production")
//        self.subscription = self.bleController.onDiscoverPublisher?.sink(receiveValue: { devices in
//            self.devices = devices
//        })
    }
    
    deinit {
        self.subscription?.cancel()
    }
    
    func scan() {
        devices.removeAll()
        bleController.scanPeriphelars()
    }
    
}
