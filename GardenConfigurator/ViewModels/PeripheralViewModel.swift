//
//  PeripheralViewModel.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 22/06/21.
//

import Foundation


class PeripheralViewModel: ObservableObject {
    
    init(mockDevice: MockPeripheral) {
        self.mockDevice = mockDevice
    }
    
    @Published var mockDevice: MockPeripheral
    
}
