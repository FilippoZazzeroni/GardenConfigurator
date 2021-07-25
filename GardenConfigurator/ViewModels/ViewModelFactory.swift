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
    
    static func makeBluetoothViewModel() -> BluetoothsViewModel {
        // inject the controller here
        return BluetoothsViewModel(bleController: bleController)
    }
    
    static func makePeripheralViewModel(device: CBPeripheral) -> PeripheralViewModel {
        return PeripheralViewModel(device: device, bleController: bleController)
    }
    
    //TODO implement make view model func for other class
}
