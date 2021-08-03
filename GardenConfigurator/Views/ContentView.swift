//
//  ContentView.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 11/04/21.
//

import SwiftUI

//TODO implementare comunicazione con server 
struct ContentView: View {
    
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
    
    //TODO da portare nello view model
    @State private var isPresented = false
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                
                if self.viewModel.devices.isEmpty {
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Text("Add device")
                    }
                } else {
                    List {
                        ForEach(self.viewModel.devices, content: { device in
                            NavigationLink("\(device.name ?? "unknown")", destination: RemoteDeviceStatusView())
                        }).onDelete(perform: { index in
                            print("trying to delette")
                        })
                    }
                }
            }
            
            .navigationBarTitle(Text("Garden Configurator"))
            .navigationBarItems(trailing: Button(action: {
                isPresented.toggle()
            }){
                Image(systemName: "plus")
            }).sheet(isPresented: $isPresented, onDismiss: self.viewModel.readData ,content: {
                BluetoothsView(viewModel: ViewModelFactory.makeBluetoothViewModel())
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        // inject just for debug
        ContentView(viewModel: ViewModelFactory.makeContentViewModel())
    }
}
