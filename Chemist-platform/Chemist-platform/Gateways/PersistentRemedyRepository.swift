//
//  PersistentRemedyGateway.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation
import Chemist_domain
import CoreData
import ReactiveSwift
import Result

class RemedyGateway: RemedyUseCase  {
    
    let context: NSManagedObjectContext
    
    required init(_ context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetchRemedy(at index: Int) -> SignalProducer<Remedy, AnyError> {
        return SignalProducer<Remedy, AnyError>{ observer, lifetime in
            
        }
    }
    
    func fetchRemedyDescription(at index: Int) -> SignalProducer<RemedyDescription, AnyError> {
        return SignalProducer<RemedyDescription, AnyError>{ observer, lifetime in

        }
    }
}
