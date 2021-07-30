//
//  ViewModelFactory.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 18/04/21.
//

import Foundation
import CoreBluetooth

/// creates view models and controllers
class ViewModelFactory {
    
    /// instaciate controller
    static let bleController = BleContoller()
    
    static let dbHelper = DbHelper()
    
    static func makeBluetoothViewModel() -> BluetoothsViewModel {
        // inject the controller here
        return BluetoothsViewModel(bleController: bleController)
    }
    
    static func makePeripheralViewModel(device: MockPeripheral) -> PeripheralViewModel {
        return PeripheralViewModel(device: device, bleController: bleController, dbHelper: dbHelper)
    }
    
    //TODO implement make view model func for other class
}
