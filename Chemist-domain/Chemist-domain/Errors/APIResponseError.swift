//
//  APIResponseError.swift
//  Chemist-domain
//
//  Created by Sergey Navka on 2/25/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation

//
//  APIError.swift
//  Platform
//
//  Created by Ihor Teltov on 1/28/18.
//  Copyright © 2018 Cleveroad Inc. All rights reserved.
//

import Foundation

public struct APIResponseError: Decodable, LocalizedError {
    public let code: Int
    public let message: String
    public let errors: [APIError]
    
    enum CodingKeys: String, CodingKey {
        case code
        case message
        case errors
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decode(Int.self, forKey: .code)
        message = try container.decode(String.self, forKey: .message)
        errors = try container.decode([APIError].self, forKey: .errors)
    }
}

public struct APIError: Decodable, LocalizedError {
    
    enum CodingKeys: String, CodingKey {
        case code
        case message
    }
    
    public let code: Int
    public let message: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(Int.self, forKey: .code)
        self.message = try container.decode(String.self, forKey: .message)
    }
}
