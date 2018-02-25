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

extension NSManagedObjectContext: ReactiveExtensionsProvider {}
extension Reactive where Base == NSManagedObjectContext {
    func save() -> SignalProducer<(),DomainError> {
        return SignalProducer<Void,DomainError> { [weak base] observer, lifetime in
            guard let base = base else {
                observer.send(error: .save(NSError(domain: "", code: -1999, userInfo: [NSLocalizedDescriptionKey:"NSManagedObjectContext is nil"])))
                return
            }
            base.perform {
                do {
                    try base.save()
                    observer.sendCompleted()
                } catch let error {
                    observer.send(error: .save(error))
                }
            }
        }
    }
}
