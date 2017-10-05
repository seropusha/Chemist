//
//  AppDelegateItemMock.swift
//  Chemist
//
//  Created by Sergey Navka on 10/5/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

class AppDelegateItemMock: NSObject, UIApplicationDelegate {
    
    fileprivate(set) var isLaunched: Bool = false

    override init() {
        super.init()
    }
}

//MARK: - UIApplicationDelegate
extension AppDelegateItemMock {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        isLaunched = true
        return true
    }
}
