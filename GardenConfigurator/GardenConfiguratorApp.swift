//
//  GardenConfiguratorApp.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 11/04/21.
//

import SwiftUI

@main
struct GardenConfiguratorApp: App {
    
    let viewModelFactory = ViewModelFactory()
    
    var body: some Scene {
        WindowGroup {
            ContentView(bluetoothsViewModel: viewModelFactory.makeBluetoothViewModel())
        }
    }
}
