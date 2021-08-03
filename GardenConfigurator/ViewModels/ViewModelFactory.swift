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
    
    // instaciate controller
    static private let bleController = BleContoller()
    
    static private let dbHelper = DbHelper()
    
    static func makeContentViewModel() -> ContentViewModel {
        // inject the controller here
        return ContentViewModel(dbHelper: dbHelper)
    }
    
    static func makeBluetoothViewModel() -> BluetoothsViewModel {
        // inject the controller here
        return BluetoothsViewModel(bleController: bleController)
    }
    
    static func makePeripheralViewModel(device: MockPeripheral) -> PeripheralViewModel {
        return PeripheralViewModel(device: device, bleController: bleController, dbHelper: dbHelper)
    }
    
    static func makeRemoteDeviceStatusViewModel() -> RemoteDeviceStatusViewModel {
        return RemoteDeviceStatusViewModel()
    }

}
