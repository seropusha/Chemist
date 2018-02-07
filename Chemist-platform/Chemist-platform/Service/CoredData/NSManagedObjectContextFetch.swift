//
//  NSManagedObjectContext+Extension.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation
import CoreData

protocol NSManagedObjectContextFetch {
    func allEntities<T: NSManagedObject>(withType type: T.Type) throws -> [T]
    func allEntities<T: NSManagedObject>(withType type: T.Type, predicate: NSPredicate?) throws -> [T]
    func addEntity<T: NSManagedObject>(withType type : T.Type) -> T?
}

extension NSManagedObjectContext: NSManagedObjectContextFetch {
    func allEntities<T: NSManagedObject>(withType type: T.Type) throws -> [T] {
        return try allEntities(withType: type, predicate: nil)
    }
    
    func allEntities<T : NSManagedObject>(withType type: T.Type, predicate: NSPredicate?) throws -> [T] {
        let request = NSFetchRequest<T>(entityName: T.description())
        request.predicate = predicate
        let results = try self.fetch(request)
        
        return results
    }
    
    func addEntity<T : NSManagedObject>(withType type: T.Type) -> T? {
        guard let entity = NSEntityDescription.entity(forEntityName: T.description(), in: self) else {
            return nil
        }
        let record = T(entity: entity, insertInto: self)
        
        return record
    }
}
