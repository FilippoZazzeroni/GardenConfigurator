//
//  RemoteDeviceStatusView.swift
//  GardenConfigurator
//
//  Created by filippo zazzeroni on 03/08/21.
//

import SwiftUI

struct RemoteDeviceStatusView: View {
    
    @ObservedObject var viewModel: RemoteDeviceStatusViewModel
    
    @State private var isFirstTabSelected = true
    
    var body: some View {
        VStack {
            Picker("", selection: $isFirstTabSelected, content: {
                Text("Status").tag(true)
                Text("Timer").tag(false)
            }).pickerStyle(SegmentedPickerStyle())
            .padding(EdgeInsets.init(top: 16.0, leading: 16.0, bottom: .zero, trailing: 16.0))
            
            if isFirstTabSelected {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    StatusView(response: viewModel.response)
                }
                
            } else {
                TimerView()
            }
            
            
            Spacer()
        }.navigationBarTitle("test", displayMode: .inline)
    }
}



struct TimerView: View {
    
    @State private var timeStart: Date = Date.init()
    
    var body: some View {
        VStack {
            DatePicker("Time start", selection: $timeStart).padding()
            DatePicker("Time end", selection: $timeStart).padding(EdgeInsets.init(top: .zero, leading: 16.0, bottom: 16.0, trailing: 16.0))
            Button(action: {}) {
                Text("Set time")
                    .foregroundColor(Color.white)
                    .frame(width: 200, alignment: .center)
                    .background(Color.accentColor)
                    .cornerRadius(10.0)
                
            }
        }
    }
}

struct StatusView: View {
    
    let response: NetworkResponse
    
    var body: some View {
        Text(response.status)
    }
}

struct RemoteDeviceStatus_Preview: PreviewProvider {
    static var previews: some View {
        RemoteDeviceStatusView(viewModel: ViewModelFactory.makeRemoteDeviceStatusViewModel())
    }
}

