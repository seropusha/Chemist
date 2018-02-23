//
//  Decoder+ManagedObjectContext.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/23/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation
import CoreData

extension CodingUserInfoKey {
    static let contextKey = CodingUserInfoKey(rawValue: "ManagedObjectContext")!
}

extension Decoder {
    var managedContext: NSManagedObjectContext {
        guard let context = userInfo[.contextKey] as? NSManagedObjectContext else {
            fatalError("Decoder hasn't NSManagedObjectContext in userInfo")
        }
        return context
    }
}

extension JSONDecoder {
    var managedContext: NSManagedObjectContext? {
        get { return userInfo[.contextKey] as? NSManagedObjectContext }
        set { userInfo[.contextKey] = newValue }
    }
}
