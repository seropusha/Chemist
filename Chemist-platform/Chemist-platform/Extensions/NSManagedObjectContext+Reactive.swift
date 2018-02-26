//
//  NSManagedObjectContext+Reactive.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/25/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Chemist_domain
import CoreData
import ReactiveSwift
import Result

extension NSManagedObjectContext: ReactiveExtensionsProvider {}
extension Reactive where Base: NSManagedObjectContext {
    func save() -> SignalProducer<(),DomainError> {
        return SignalProducer<Void,DomainError> { [weak base] observer, lifetime in
            guard let base = base else {
                observer.send(error: .persistance(.failed))
                return
            }
            base.perform {
                do {
                    try base.save()
                    observer.sendCompleted()
                } catch let error {
                    observer.send(error: .persistance(.save(error)))
                }
            }
        }
    }
    
//    func updateOrSave<T: NSManagedObject>(_ items: [T]) -> SignalProducer<[T], DomainError> {
////        return SignalProducer<[T], DomainError> { [weak base] observer, lifetime in
////            guard let base = base else {
////                observer.send(error: .persistance(.failed))
////                return
////            }
////            base.reactive
////        }
//
////        let predicate = NSPredicate(format: "id == %@", id)
//       // return base.reactive.fetch(withType: T.self, predicate: NSPredicate(format: <#T##String#>, <#T##args: CVarArg...##CVarArg#>))
//    }
    
    func fetch<T: NSManagedObject>(withType type: T.Type) -> SignalProducer<[T],DomainError> {
        return fetch(withType: type, predicate: nil)
    }
    
    func fetch<T: NSManagedObject>(withType type: T.Type, predicate: NSPredicate?) -> SignalProducer<[T],DomainError> {
        return SignalProducer<[T], DomainError> { [weak base] observer, lifetime in
            guard let base = base else {
                observer.send(error: .persistance(.failed))
                return
            }
            let request = NSFetchRequest<T>(entityName: T.description())
            request.predicate = predicate
            do {
                let results = try base.fetch(request)
                observer.send(value: results)
                observer.sendCompleted()
            } catch let error {
                observer.send(error: .persistance(.fetch(error)))
            }
        }
    }
    
    func create<T: NSManagedObject>(withType type: T.Type) -> SignalProducer<T?,DomainError> {
        return SignalProducer<T?, DomainError> { [weak base] observer, lifetime in
            guard let base = base, let entity = NSEntityDescription.entity(forEntityName: T.description(), in: base) else {
                observer.send(value: nil)
                observer.sendCompleted()
                return
            }
            let record = T(entity: entity, insertInto: base)
            observer.send(value: record)
            observer.sendCompleted()
        }
    }
}
