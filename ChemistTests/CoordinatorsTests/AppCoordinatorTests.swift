//
//  AppCoordinatorTests.swift
//  Chemist
//
//  Created by Sergey Navka on 10/5/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import XCTest
@testable import Chemist

class AppCoordinatorTests: XCTestCase {
    
    var coordinator: AppCoordinator!
    var mockWindow: UIWindow!
    
    override func setUp() {
        super.setUp()
        mockWindow = UIWindow(frame: UIScreen.main.bounds)
        coordinator = AppCoordinator(window: mockWindow, services: Services())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_make_key_window() {
        XCTAssertEqual(mockWindow, UIApplication.shared.keyWindow, "mockWindow must be keyWindow")
    }
}
