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
    
    var window: UIWindow!
    var launchItem: AppDelegateLaunch!
    
    override func setUp() {
        super.setUp()
        window = UIApplication.shared.delegate!.window!!
        launchItem = AppDelegateLaunch(window: window)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_create_window_and_appCoordinator() {
        XCTAssertNotNil(launchItem.startWindow, "window must be created")
        XCTAssertNotNil(launchItem.appCoordinator, "app coordinator must be created")
    }
    
}


