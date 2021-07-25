//
//  GardenConfiguratorApp.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 11/04/21.
//

import SwiftUI

@main
struct GardenConfiguratorApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(bluetoothsViewModel: ViewModelFactory.makeBluetoothViewModel())
        }
    }
}
