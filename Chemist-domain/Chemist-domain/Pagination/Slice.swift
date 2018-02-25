//
//  Slice.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/25/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

public struct Slice<Element> {
    public var values: [Element]
    public let pagination: Pagination
    
    public var isComplete: Bool {
        return !pagination.hasMoreBefore && !pagination.hasMoreAfter
    }
    
    // MARK: - Init
    
    public init(values: [Element], pagination: Pagination = .none) {
        self.values = values
        self.pagination = pagination
    }
    
    // MARK: - Operations
    
    public func appending(_ slice: Slice) -> Slice {
        let values = self.values + slice.values
        let pagination = Pagination(cursorBefore: self.pagination.cursorBefore,
                                    cursorAfter: slice.pagination.cursorAfter)
        return Slice(values: values, pagination: pagination)
    }
    
    public func prepending(_ slice: Slice) -> Slice {
        let values = slice.values + self.values
        let pagination = Pagination(cursorBefore: slice.pagination.cursorBefore,
                                    cursorAfter: self.pagination.cursorAfter)
        return Slice(values: values, pagination: pagination)
    }
}
