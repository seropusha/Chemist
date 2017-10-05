//
//  AppDelegateLaunchTests.swift
//  Chemist
//
//  Created by Sergey Navka on 10/5/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import XCTest
@testable import Chemist

class AppDelegateLaunchTests: XCTest {
    
    var launchItem: AppDelegateLaunch!
    
    override func setUp() {
        super.setUp()
        launchItem = AppDelegateLaunch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_create_window_and_appCoordinator() {
        XCTAssertNotNil(launchItem.applicationWindow, "window must be created")
        XCTAssertNotNil(launchItem.appCoordinator, "app coordinator must be created")
    }
    
}


