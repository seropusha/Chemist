//
//  DomainError.swift
//  Chemist-domain
//
//  Created by Sergey Navka on 2/25/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation

public enum DomainError: Error {
    case api(APIResponseError)
    case decodable(Error)
    case underlying(Error)
    case save(Error)
    case `internal`
}
