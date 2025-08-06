//
//  DataController.swift
//  CoinBase
//
//  Created by fin on 05/08/2025.
//
import CoreData

class DataController: ObservableObject  {
    
    static let shared = DataController()

    let container: NSPersistentContainer = NSPersistentContainer(name: "CoinBase")

    init(inMemory: Bool = false) {
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error)")
            }
            else {
                print("Description: \(description)")
            }
        }
        
    }
    
}
