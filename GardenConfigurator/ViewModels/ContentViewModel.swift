//
//  ContentViewModel.swift
//  GardenConfigurator
//
//  Created by filippo zazzeroni on 02/08/21.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    init(dbHelper: DbHelper) {
        self.dbHelper = dbHelper
        self.readData()
    }
    
    let dbHelper: DbHelper
    
    @Published var devices: [Peripheral] = []
    
    func readData() {
        do {
            devices = try dbHelper.readData()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func deleteData(device: Peripheral) {
        devices.removeAll(where: { peripheral in
            return device.id == peripheral.id
        })
        dbHelper.deleteData(peripheral: device)
    }
    
    func testNetworkCall() {
        NetworkService().fetchStatus()
    }
}
