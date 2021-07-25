//
//  PeripheralViewModel.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 22/06/21.
//

import Foundation
import CoreBluetooth

class PeripheralViewModel: ObservableObject {
    
    init(device: CBPeripheral, bleController: BleContoller) {
        self.device = device
        self.bleController = bleController
        print("init")
    }
    
    @Published var device: CBPeripheral
    
    private let bleController: BleContoller
    
    // ssid collected from the form 
    var ssid: String = ""
    
    // password collected from the form 
    var password: String = ""
    
    /// connect to ble device [device]
    func connect() {
        #warning("change is mock in production")
        device = bleController.connect(peripheral: device, isMock: true) as! CBPeripheral
    }
    
}
