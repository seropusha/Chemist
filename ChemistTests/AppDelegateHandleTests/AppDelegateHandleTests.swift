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

    func test_appdelegate_handle_items() {
        let appDelegate = UIApplication.shared.delegate as! TestAppDelegate
        let isAllItemsLaunched = appDelegate.items.filter{ !$0.isLaunched }.isEmpty
        XCTAssertTrue(isAllItemsLaunched, "All app delegate items must call didFinishLaunchWithOptions method")
    }

}
