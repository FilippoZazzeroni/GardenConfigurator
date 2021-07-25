//
//  PeripheralView.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 22/06/21.
//

import SwiftUI
import CoreBluetooth

struct PeripheralView: View {
    
    @ObservedObject var viewModel: PeripheralViewModel
    

    var body: some View {
        
        NavigationView{
            
            VStack {
                
                if self.viewModel.device.state == .connected {
                    Text("Set WiFi credentialds")
                        .font(.headline)
                    
                    TextField("SSID", text: self.$viewModel.ssid)
                        .padding(8.0)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10.0)
                        .padding(.init(arrayLiteral: [Edge.Set.horizontal, Edge.Set.top]))
                    TextField("password", text: self.$viewModel.password)
                        .padding(8.0)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10.0)
                        .padding()
                    
                    Button(action: {}) {
                        Text("Send")
                            .foregroundColor(Color.white)
                            .frame(width: 200, alignment: .center)
                            .background(Color.accentColor)
                            .cornerRadius(10.0)
                        
                    }
                    Spacer()
                    
                }
                
                if self.viewModel.device.state == .disconnected {
                    Button(action: {
                        self.viewModel.connect()
                    }) {
                        Text("Connect")
                            .foregroundColor(Color.white)
                            .frame(width: 200, alignment: .center)
                            .background(Color.accentColor)
                            .cornerRadius(10.0)
                    }
                    
                }
                
                
                
            }.navigationTitle(Text("\(self.viewModel.device.name == nil ? "not known" : self.viewModel.device.name!)"))
            .navigationBarItems(trailing: Button(action: {}) {
                Image(systemName: "square.and.arrow.up")
            })
            #warning("TODO: insert closure to button to save device")
            
            
        }
        
    }
}

struct PeripheralView_Previews: PreviewProvider {
    static var previews: some View {
        PeripheralView(viewModel: ViewModelFactory.makePeripheralViewModel(device:  MockPeripheral(name: "Test", state: .disconnected)))
    }
}
