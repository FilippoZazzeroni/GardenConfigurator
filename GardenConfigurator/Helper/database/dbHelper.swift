//
//  dbHelper.swift
//  GardenConfigurator
//
//  Created by filippo zazzeroni on 28/07/21.
//

import Foundation
import CoreData

//TODO: ottimizzare lettura e scrittura nel db
class DbHelper {
    
    init() {
        do {
            _ = try self.readData()
        } catch {
            print(error)
        }
    }
    
    private let persitentContainer: NSPersistentContainer = {
        var loadError: Error?
        let container = NSPersistentContainer(name: "PeripheralModel")
        container.loadPersistentStores {description, error in
            if error != nil {
                loadError = error
                //TODO: handle error here
                print(error!.localizedDescription)
            }
            
        }
        return container
    }()
    
    private var peripherals: [Peripheral] = []
    
    
    func createData(peripheralName: String) {
        
        //TODO: fare comparazione non sul nome
        // check if item was just stored
        let isItemStored = peripherals.contains(where: {item in
            return item.name == peripheralName
        })
        
        if isItemStored {
            //TODO: capire se fare error handling o come notificare l'interfaccia che è gia salvato il device
            return
        }
        
        let context = persitentContainer.viewContext
        
        // entity can't be nil beacuse it exists
        let entity = NSEntityDescription.entity(forEntityName: "Peripheral", in: context)
        
        let peripheral = NSManagedObject.init(entity: entity!, insertInto: context)
        
        peripheral.setValue(peripheralName, forKey: "name")
        
        
        
        do {
            guard !context.hasChanges else {
                try context.save()
                return
            }
            
        } catch let error as NSError {
            //TODO: handle error
            print(error.userInfo)
        }
        
    }
    
    /// read all data saved in the db
    //TODO: capire il dato da salvare
    func readData() throws -> [Peripheral] {
            
        do {
            let peripherals = try persitentContainer.viewContext.fetch(NSFetchRequest(entityName: "Peripheral")) as! [Peripheral]
            self.peripherals = peripherals
            return peripherals
        } catch let error as NSError {
            throw error
        }
        
    }
    
    func deleteData(peripheral: Peripheral) {
        
        let context = persitentContainer.viewContext
        
        context.delete(peripheral)
        
        do {
            guard !context.hasChanges else {
                try context.save()
                return
            }
            
        } catch let error as NSError {
            //TODO: handle error
            print(error.userInfo)
        }
    }
    
}
