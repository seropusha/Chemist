//
//  NSManagedObjectContext+Extension.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation
import CoreData
import ReactiveSwift
import Result

protocol NSManagedObjectContextFetch {
    func allEntities<T: NSManagedObject>(withType type: T.Type) -> SignalProducer<[T],AnyError>
    func allEntities<T: NSManagedObject>(withType type: T.Type, predicate: NSPredicate?) ->  SignalProducer<[T],AnyError>
    func addEntity<T: NSManagedObject>(withType type : T.Type) ->  SignalProducer<T?,AnyError>
}

extension NSManagedObjectContext: NSManagedObjectContextFetch {
    func allEntities<T: NSManagedObject>(withType type: T.Type) -> SignalProducer<[T],AnyError> {
        return allEntities(withType: type, predicate: nil)
    }
    
    func allEntities<T: NSManagedObject>(withType type: T.Type, predicate: NSPredicate?) -> SignalProducer<[T],AnyError> {
        return SignalProducer<[T], AnyError> { [unowned self] observer, lifetime in
            let request = NSFetchRequest<T>(entityName: T.description())
            request.predicate = predicate
            do {
                let results = try self.fetch(request)
                observer.send(value: results)
                observer.sendCompleted()
            } catch let error {
                observer.send(error: .init(error))
            }
        }
    }
    
    func addEntity<T : NSManagedObject>(withType type: T.Type) -> SignalProducer<T?,AnyError> {
        return SignalProducer<T?, AnyError> { observer, lifetime in
            guard let entity = NSEntityDescription.entity(forEntityName: T.description(), in: self) else {
                observer.send(value: nil)
                observer.sendCompleted()
                return
            }
            let record = T(entity: entity, insertInto: self)
            observer.send(value: record)
            observer.sendCompleted()
        }
    }
}
