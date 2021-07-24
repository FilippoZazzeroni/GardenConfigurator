//
//  PeripheralView.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 22/06/21.
//

import SwiftUI

struct PeripheralView: View {
    
    @ObservedObject var viewModel: PeripheralViewModel
    
    var body: some View {
        #warning("da capire perche viene sempre visualizzato lo stesso id")
        Text("\(self.viewModel.mockDevice.id)")
    }
}

struct PeripheralView_Previews: PreviewProvider {
    static var previews: some View {
        PeripheralView(viewModel: PeripheralViewModel(mockDevice: MockPeripheral(id: 1, name: "Test", status: "Disconnected")))
    }
}
