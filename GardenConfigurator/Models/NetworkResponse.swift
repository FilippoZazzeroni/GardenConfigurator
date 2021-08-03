//
//  NetworkResponse.swift
//  GardenConfigurator
//
//  Created by filippo zazzeroni on 02/08/21.
//

import Foundation

struct NetworkResponse: Codable {
    /// time in unix time stamp
    let timeStart: Int
    /// time in unix time stamp
    let timeEnd: Int
    /// status of the device
    let status: String
}
