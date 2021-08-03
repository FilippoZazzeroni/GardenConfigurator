//
//  NetworkProtocol.swift
//  GardenConfigurator
//
//  Created by filippo zazzeroni on 02/08/21.
//

import Foundation

/// The protocol that defines the network related tasks
protocol NetworkProtocol {
    
    /// it fetches the status of the device atteched to the app
    func fetchStatus() -> NetworkResponse
    
    /// sets the data on the ThingSpeak service
    func setData(timeStart: Date, timeEnd: Date)
    
}
