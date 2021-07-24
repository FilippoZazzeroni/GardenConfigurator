//
//  File.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 22/06/21.
//

import Foundation

/// mock bluetooth pheripheral
struct MockPeripheral: Identifiable {
    let id: Int
    let name: String
    var status: String
}
