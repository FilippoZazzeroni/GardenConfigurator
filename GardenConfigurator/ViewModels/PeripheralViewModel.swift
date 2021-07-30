//
//  PeripheralViewModel.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 22/06/21.
//

import Foundation
import CoreBluetooth

class PeripheralViewModel: ObservableObject {
    
    init(device: MockPeripheral, bleController: BleContoller, dbHelper: DbHelper) {
        self.device = device
        self.bleController = bleController
        self.dbHelper = dbHelper
        print("init")
    }
    
    @Published var device: MockPeripheral
    
    @Published var isSaveAlertShown: Bool = false
    
    private let bleController: BleContoller
    
    private let dbHelper: DbHelper
    
    // ssid collected from the form 
    var ssid: String = ""
    
    // password collected from the form 
    var password: String = ""
    
    /// connect to ble device [device]
    func connect() {
        //TODO: change is mock in production and add peripheral
        device = bleController.connect(peripheral: nil, mockPeripheral: device, isMock: true) as! MockPeripheral
    }
    
    func saveDevice() {
        dbHelper.createData(peripheralName: device.name)
    }
    
}
