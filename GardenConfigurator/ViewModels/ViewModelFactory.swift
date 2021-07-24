//
//  ViewModelFactory.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 18/04/21.
//

import Foundation

/// creates view models and controllers
class ViewModelFactory {
    
    /// instaciate controller
    let bleController = BleContoller()
    
    func makeBluetoothViewModel() -> BluetoothsViewModel {
        // inject the controller here
        return BluetoothsViewModel(bleController: bleController)
    }
    
    //TODO implement make view model func for other class
}
