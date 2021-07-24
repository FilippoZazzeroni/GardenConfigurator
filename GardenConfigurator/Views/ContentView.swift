//
//  ContentView.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 11/04/21.
//

import SwiftUI

struct ContentView: View {
    
    //TODO da portare nello view model
    @State private var isPresented = false
    
    let bluetoothsViewModel: BluetoothsViewModel
    
    var body: some View {
        NavigationView {
            
            VStack {
                Button(action: {
                    isPresented.toggle()
                }) {
                    Text("Add device")
                }
            }
            .navigationBarTitle(Text("Garden Configurator"))
            .navigationBarItems(trailing: Button(action: {
                isPresented.toggle()
            }){
                Image(systemName: "plus")
            }).sheet(isPresented: $isPresented, content: {
                BluetoothsView(viewModel: self.bluetoothsViewModel)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        // inject just for debug
        ContentView(bluetoothsViewModel: BluetoothsViewModel(bleController: BleContoller()))
    }
}
