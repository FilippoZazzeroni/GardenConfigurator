//
//  NetworkService.swift
//  GardenConfigurator
//
//  Created by filippo zazzeroni on 02/08/21.
//

import Foundation

class NetworkService: NetworkProtocol {
    
    private let readUrl: URL = URL(string: "https://api.thingspeak.com/channels/1115617/feeds.json?api_key=DSD75VRJZE9ZIUWH&results=1")!
    
    func fetchStatus() -> NetworkResponse {
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: readUrl) { data, response, error in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                print(error)
            }
            
        }
        
        dataTask.resume()
        
        //TODO da cambiare 
        return NetworkResponse(timeStart: 12, timeEnd: 12, status: "Online")
        
    }
    
    func setData(timeStart: Date, timeEnd: Date) {
        print("to implement")
    }
    
}
