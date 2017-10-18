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
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIApplication.shared.delegate!.window!!
        coordinator = AppCoordinator(window: window, services: Services())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_make_key_window() {
        XCTAssertEqual(window, UIApplication.shared.keyWindow, "mockWindow must be keyWindow")
    }
}
