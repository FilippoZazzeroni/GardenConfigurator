//
//  File.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 26/08/21.
//

import Foundation

/// Adds loading functionality to a view model 
protocol LoadableViewModel {
    var isLoading: Bool {get set}
}
