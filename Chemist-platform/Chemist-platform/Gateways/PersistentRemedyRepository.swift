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
    let provider: Provider<API.RemedyAPI>
    
    required public init(_ context: NSManagedObjectContext,
                         provider: Provider<API.RemedyAPI>) {
        self.context = context
        self.provider = provider
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
