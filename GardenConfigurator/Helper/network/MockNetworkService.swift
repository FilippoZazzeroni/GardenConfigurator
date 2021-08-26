//
//  MockNetworkService.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 26/08/21.
//

import Foundation

class MockNetworkService: NetworkProtocol {
    func fetchStatus() -> NetworkResponse {
        return OfflineResponse()
    }
    
    func setData(timeStart: Date, timeEnd: Date) {
        print("set data")
    }
    
    
}
