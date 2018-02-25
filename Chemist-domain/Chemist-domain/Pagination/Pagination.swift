//
//  Pagination.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/25/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation


// MARK: - Protocols

public protocol PaginationCursor {
    var hasMore: Bool { get }
    var parameters: [String: Any] { get }
}

public protocol PaginationStrategy {
    func cursors(from json: [String: Any]?) -> (before: PaginationCursor?, after: PaginationCursor?)
}

public struct Pagination {
    
    // MARK: - Properties
    
    public let cursorBefore: PaginationCursor?
    public let cursorAfter: PaginationCursor?
    
    public var hasMoreAfter: Bool {
        return cursorAfter?.hasMore ?? false
    }
    public var hasMoreBefore: Bool {
        return cursorBefore?.hasMore ?? false
    }
    
    // MARK: - Init
    
    public static let none = Pagination()
    
    public init(cursorBefore: PaginationCursor? = nil, cursorAfter: PaginationCursor? = nil) {
        self.cursorBefore = cursorBefore
        self.cursorAfter = cursorAfter
    }
}

// MARK: - Pagination

public extension Pagination {
    public struct Strategy {
        public let rawValue: PaginationStrategy
    }
}
