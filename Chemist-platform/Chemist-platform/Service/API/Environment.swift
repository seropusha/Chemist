//
//  Environment.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation

enum Environment {
    case dev
    case stage
    case production
    
    static let current: Environment = .dev
}

extension Environment {
    var baseURL: URL {
        switch self {
        default:
            return URL(string: "http//:localhost:7070")!
        }
    }
}
