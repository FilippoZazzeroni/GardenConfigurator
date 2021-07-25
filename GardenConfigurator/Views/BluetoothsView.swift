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
                    ForEach(self.viewModel.devices, content: { device in
                        
                        Button(action: {
                            self.viewModel.selectedDevice = device
                        }) {
                            HStack {
                                Text("\(device.name == nil ? "not known" : device.name!)")
                            }
                        }.sheet(item: self.$viewModel.selectedDevice, content: { selectedDevice in
                            
                            PeripheralView(viewModel: ViewModelFactory.makePeripheralViewModel(device: selectedDevice))
                        
                            
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

