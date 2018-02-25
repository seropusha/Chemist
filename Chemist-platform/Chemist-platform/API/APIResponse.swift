//
//  APIResponse.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/12/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation
import Chemist_domain
import struct Chemist_domain.Slice

struct APIResponse<Data: Decodable>: Decodable {
    let data: Data
    private let paginationJSON: [String: Any]?
    
    private enum APIResponseKeys: String, CodingKey {
        case data        = "data"
        case pagination  = "pagination"
    }
    
    init(data: Data, pagination: [String: Any]?) {
        self.data = data
        self.paginationJSON = pagination
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: APIResponseKeys.self)
        
        self.data = try container.decode(Data.self, forKey: .data)
        self.paginationJSON = try container.decode([String:Any]?.self, forKey: .pagination)
    }
    
    func attemptMap<N>(_ transform: (Data) throws -> N) throws -> APIResponse<N> {
        let data = try transform(self.data)
        return .init(data: data, pagination: paginationJSON)
    }
    
    func slice<Element>(_ strategy: Pagination.Strategy) -> Slice<Element> where Data == [Element] {
        let cursors = strategy.rawValue.cursors(from: paginationJSON)
        let pagination = Pagination(cursorBefore: cursors.before, cursorAfter: cursors.after)
        return Slice(values: data, pagination: pagination)
    }
}



