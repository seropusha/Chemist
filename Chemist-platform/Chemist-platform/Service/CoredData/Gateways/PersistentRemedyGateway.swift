//
//  PersistentRemedyGateway.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation
import CoreData

protocol PersistentRemedyGateway {
    var context: NSManagedObjectContextFetch { get }
    init(_ context: NSManagedObjectContextFetch)
    
    //TODO: get, create, get with pagination
}

class CoreDataRemedyGateway: PersistentRemedyGateway {
    
    let context: NSManagedObjectContextFetch
    
    required init(_ context: NSManagedObjectContextFetch) {
        self.context = context
    }
    
    //TODO: Emplimentation
}
