//
//  RemoteDeviceStatusViewModel.swift
//  GardenConfigurator
//
//  Created by filippo zazzeroni on 03/08/21.
//

import Foundation


class RemoteDeviceStatusViewModel: ObservableObject, LoadableViewModel {
    
    
    
    init(networkService: NetworkProtocol) {
        self.network = networkService
        self.network.fetchStatus()
    }
    
    
    
    private var network: NetworkProtocol
    
    @Published var response: NetworkResponse = OfflineResponse()
    
    @Published var isLoading: Bool = false
    
    func fetchStatus() {
        isLoading = true
        response = network.fetchStatus()
        isLoading = false
    }
    
    
}
