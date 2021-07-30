//
//  dbHelper.swift
//  GardenConfigurator
//
//  Created by filippo zazzeroni on 28/07/21.
//

import Foundation
import CoreData

class DbHelper {
    
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
    
    
    func createData(peripheralName: String) {
        let context = persitentContainer.viewContext
        
        // entity can't be nil beacuse it exists
        let entity = NSEntityDescription.entity(forEntityName: "Peripheral", in: context)
        
        let periphreal = NSManagedObject.init(entity: entity!, insertInto: context)
        
        periphreal.setValue(peripheralName, forKey: "name")
        
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
        let context = persitentContainer.viewContext
        
        // can't be nil
        let entity = NSEntityDescription.entity(forEntityName: "Peripheral", in: context)
        
        do {
            let peripherals = try persitentContainer.viewContext.fetch(NSFetchRequest(entityName: "Peripheral"))
            return peripherals as! [Peripheral]
        } catch let error as NSError {
            throw error
        }
        
    }
    
    
}
