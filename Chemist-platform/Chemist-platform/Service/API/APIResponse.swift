//
//  APIResponse.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/12/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation

struct MappingError: LocalizedError {
    
    let json: Any?
    let keyPath: String?
}

struct APIResponse<Data: Decodable>: Decodable {
    let version: String
    let data: Data
    private let paginationJSON: [String: Any]?
    
    private enum APIResponseKeys: String, CodingKey {
        case version     = "__V"
        case data        = "data"
        case pagination  = "pagination"
    }
    
    init(version: String, data: Data, paginationJSON: [String: Any]?) {
        self.version = version
        self.data = data
        self.paginationJSON = paginationJSON
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: APIResponseKeys.self)
        
        self.version = try container.decode(String.self, forKey: .version)
        self.data = try container.decode(Data.self, forKey: .data)
        self.paginationJSON = try container.decode([String:Any]?.self, forKey: .pagination)
    }
    
//    init(map: Map) throws {
//        version = try map.value("_v")
//        data = try map.value("data")
//        paginationJSON = try? map.value("pagination")
//    }
    
    func attemptMap<N>(_ transform: (Data) throws -> N) throws -> APIResponse<N> {
        let data = try transform(self.data)
        return .init(version: version, data: data, paginationJSON: paginationJSON)
    }
    
//    func slice<Element>(_ strategy: Pagination.Strategy) -> Slice<Element> where Data == [Element] {
//        let cursors = strategy.rawValue.cursors(from: paginationJSON)
//        let pagination = Pagination(cursorBefore: cursors.before, cursorAfter: cursors.after)
//        return Slice(values: data, pagination: pagination)
//    }
    
}



