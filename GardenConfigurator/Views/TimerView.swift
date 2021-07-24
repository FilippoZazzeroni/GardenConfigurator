//
//  TimerView.swift
//  GardenConfigurator
//
//  Created by Filippo Zazzeroni on 11/04/21.
//

import Foundation
import SwiftUI

struct TimerView: View {
    
    @State private var isModalShown: Bool = false
    
    init() {
        print("init timer view")
    }
    
    var body: some View {
        ScrollView {
            
            Text("Timer").font(.largeTitle).onTapGesture {
                handleTimer()
            }
            Button("open timer", action: handleTimer)
                .padding()
                .background(Image(systemName: "chart.pie"))
                .cornerRadius(20.0)
            
        }.actionSheet(isPresented: $isModalShown, content: {
            ActionSheet(title: Text("select start time"))
        }).background(Image("background"))
    }
    
    
    func handleTimer() {
        isModalShown = !isModalShown
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
