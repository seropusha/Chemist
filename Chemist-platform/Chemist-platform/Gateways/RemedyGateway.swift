//
//  PersistentRemedyGateway.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Chemist_domain
import struct Chemist_domain.Slice
import Foundation
import CoreData
import ReactiveSwift

final class RemedyGateway: RemedyUseCase  {
    
    
    let context: NSManagedObjectContext
    let provider: Provider<API.RemedyAPI>
    
    init(_ context: NSManagedObjectContext,
                         provider: Provider<API.RemedyAPI>) {
        self.context = context
        self.provider = provider
    }
    
    public func fetchRemedies(_ slice: Slice<Remedy>?) -> SignalProducer<Slice<Remedy>, DomainError> {
        return SignalProducer<Slice<Remedy>, DomainError> { observer, lifetime in
            
        }
    }
    
    func fetchRemedy(at index: Int) -> SignalProducer<Remedy, DomainError> {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.managedContext = context
        return provider.reactive.request(.get(id: index))
            .map(APIResponse<RemedyEntity>.self, using: jsonDecoder)
            .attemptMap({ $0.data.toRemedy() })
            .wait(completed: context.reactive.save())
    }
    
    func fetchRemedyDescription(at index: Int) -> SignalProducer<RemedyDescription, DomainError> {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.managedContext = context
        return provider.reactive.request(.get(id: index))
            .map(APIResponse<RemedyDescriptionEntity>.self, using: jsonDecoder)
            .attemptMap({ $0.data.toRemedyDescription() })
            .wait(completed: context.reactive.save())
    }
}
