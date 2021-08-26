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
        
        var status: NetworkResponse = OfflineResponse()
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: readUrl) { data, response, error in
            do {
                //TODO: deserialize data in json and then convert it to data again to decode data 
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                let jsonDecoder = JSONDecoder.init()
                print(data)
                status = try jsonDecoder.decode(SuccessfullResponse.self, from: json as! Data)
                print(json)
            } catch {
                print(error)
            }
            
        }
        
        dataTask.resume()
        
        //TODO da cambiare 
        return status
        
    }
    
    func setData(timeStart: Date, timeEnd: Date) {
        print("to implement")
    }
    
}
