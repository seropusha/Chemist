//
//  AppDelegateHandleTests.swift
//  Chemist
//
//  Created by Sergey Navka on 10/5/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import XCTest
@testable import Chemist

class AppDelegateHandleTests: XCTestCase {

    var testAppDelegate: TestAppDelegate!
    
    override func setUp() {
        super.setUp()
        testAppDelegate =  UIApplication.shared.delegate as! TestAppDelegate
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_appdelegate_handle_items() {
        let isAllItemsLaunched = testAppDelegate.items.filter{ !$0.isLaunched }.isEmpty
        XCTAssertTrue(isAllItemsLaunched, "All app delegate items must call didFinishLaunchWithOptions method")
    }

}
