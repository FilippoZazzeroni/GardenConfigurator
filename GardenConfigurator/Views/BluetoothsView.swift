//
//  BluetoothView.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 16/04/21.
//

import SwiftUI



#warning("TODO: save device to local db")
struct BluetoothsView: View {
    
    @ObservedObject var viewModel: BluetoothsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    ForEach(self.viewModel.mockDevices, content: { device in
                        
                        Button(action: {
                            self.viewModel.isSheetPresented = !self.viewModel.isSheetPresented
                        }) {
                            HStack {
                                Text(device.name)
                                Text(device.status)
                            }
                        }.sheet(isPresented: self.$viewModel.isSheetPresented, content: {
                            PeripheralView(viewModel: PeripheralViewModel(mockDevice: device))
                        })
                        
                    })
                }
                
                
            }.navigationBarTitle(Text("Add Device"))
            .navigationBarItems(trailing: Button(action: {
                viewModel.scan()
            }) {
                Image(systemName: "arrow.clockwise")
            })
        }
        
    }
}


struct BluetoothView_Preview: PreviewProvider {
    
    static var previews: some View {
        BluetoothsView(viewModel: BluetoothsViewModel(bleController: BleContoller()))
    }
}

