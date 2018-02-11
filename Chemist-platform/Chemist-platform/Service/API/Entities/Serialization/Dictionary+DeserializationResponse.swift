//
//  Dictionary+DeserializationResponse.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/11/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation

extension Dictionary where Key == AnyHashable {

    func value<T>(for key: AnyHashable) -> T? {
        return self[key] as? T
    }
    
    func value<T: JSONable>(for key: AnyHashable) -> [T]? {
        guard let array = self[key] as? [[AnyHashable:Any]] else { return nil }
        return array.flatMap({ T($0) })
    }
}
