//
//  LimitOffsetStrategy.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/25/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

public enum LimitOffset {
    public struct Cursor: PaginationCursor {
        static var defaultLimit: Int = 30
        
        let nextOffset: Int
        let nextPage: Int
        let limit: Int = Cursor.defaultLimit
        let total: Int
        
        public var hasMore: Bool {
            return nextOffset < total
        }
        
        public var parameters: [String : Any] {
            return ["offset": nextOffset, "limit": limit]
        }
    }
    
    public struct Strategy: PaginationStrategy {
        public func cursors(from json: [String: Any]?) -> (before: PaginationCursor?, after: PaginationCursor?) {
            guard let json = json,
                let nextOffset = json["nextOffset"] as? Int,
                let totalCount = json["totalCount"] as? Int,
                let nextPage = json["nextPage"] as? Int else { return (nil, nil) }
            return (nil, Cursor(nextOffset: nextOffset, nextPage: nextPage, total: totalCount))
        }
    }
}

public extension Pagination.Strategy {
    public static let limitOffset = Pagination.Strategy(rawValue: LimitOffset.Strategy())
}

