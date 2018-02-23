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

class RemedyGateway {//: RemedyUseCase  {
    
    let context: NSManagedObjectContext
    let provider: Provider<API.RemedyAPI>
    
    required public init(_ context: NSManagedObjectContext,
                         provider: Provider<API.RemedyAPI>) {
        self.context = context
        self.provider = provider
    }
    
    func fetchRemedy(at index: Int) -> SignalProducer<RemedyEntity, AnyError> {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.managedContext = context
        return provider.reactive.request(.getByID(index))
            .map(RemedyEntity.self, using: jsonDecoder)
            .mapError({ _ in return AnyError(NSError(domain: "", code: 1, userInfo: nil)) })
        
    }
    
    func fetchRemedyDescription(at index: Int) -> SignalProducer<RemedyDescription, AnyError> {
        return SignalProducer<RemedyDescription, AnyError>{ observer, lifetime in
            
        }
    }
}
