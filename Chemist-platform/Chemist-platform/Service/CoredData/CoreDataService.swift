//
//  CoreDataStack.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation
import CoreData

protocol CoreData {
    var mainMOC: NSManagedObjectContext { get }
    var privateMOC: NSManagedObjectContext { get }
    var persistentStoreCoordinator: NSPersistentStoreCoordinator { get }
    
    func saveMainContext()
}

class CoreDataService: CoreData {
    var mainMOC: NSManagedObjectContext
    var privateMOC: NSManagedObjectContext
    var persistentStoreCoordinator: NSPersistentStoreCoordinator
    
    init() {
        guard let modelURL = Bundle.main.url(forResource: "PersistentModel", withExtension: "momd") else {
            fatalError("Error loading model from bundle")
        }
        
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: mom)
        mainMOC = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        mainMOC.persistentStoreCoordinator = persistentStoreCoordinator
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = urls[urls.endIndex-1]

        let storeURL = docURL.appendingPathComponent("PersistentModel.sqlite")
        do {
            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
        
        privateMOC = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateMOC.parent = mainMOC
    }
    
    func saveMainContext() {
        if mainMOC.hasChanges {
            do {
                try mainMOC.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
