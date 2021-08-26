//
//  NetworkResponse.swift
//  GardenConfigurator
//
//  Created by filippo zazzeroni on 02/08/21.
//

import Foundation

protocol NetworkResponse {
    /// time in unix time stamp
    var timeStart: Double {get set}
    /// time in unix time stamp
    var timeEnd: Double {get set}
    /// status of the device
    var status: String {get set}
    
    
}

extension NetworkResponse {
    var dateStart: Date {
        get {
            return Date.init(timeIntervalSince1970: timeStart)
        }
    }
    
    var dateEnd: Date {
        get {
            return Date.init(timeIntervalSince1970: timeEnd)
        }
    }
}

/// Representation of successfull response from the network call.
/// The only way to instanciate this response is through the from decoder inti
struct SuccessfullResponse: NetworkResponse, Codable {
    var timeStart: Double
    
    var timeEnd: Double
    
    var status: String

}

/// representation of offilne response from the network call
struct OfflineResponse: NetworkResponse {
    var timeStart: Double = 0
    
    var timeEnd: Double = 0
    
    var status: String = "Offline"
}
