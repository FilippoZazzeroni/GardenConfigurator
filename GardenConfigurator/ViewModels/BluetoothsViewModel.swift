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
    
    /// used for mock functionality
    @Published var mockDevices: [MockPeripheral] = []
    
    /// var associated with each sheet of device in list 
    @Published var isSheetPresented = false
    
    private let bleController: BleContoller
    
    private var subscription: AnyCancellable?
    
    init(bleController: BleContoller) {
        
        self.bleController = bleController
        
        for i in 1...3 {
            self.mockDevices.append(MockPeripheral(id: i, name: "Test", status: "Disconnected"))
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
