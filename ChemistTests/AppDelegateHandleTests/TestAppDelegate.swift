//
//  TestAppDelegate.swift
//  Chemist
//
//  Created by Sergey Navka on 10/5/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

class TestAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let items: [AppDelegateItemMock]
    private(set) var handler: AppDelegateHandler
    
    override init() {
        var tempItems = [AppDelegateItemMock]()
        for _ in 0...20 {
            let mock = AppDelegateItemMock()
            tempItems.append(mock)
        }
        items = tempItems
        handler = AppDelegateHandler(items: items)
        super.init()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return handler.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        handler.applicationWillResignActive(application)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        handler.applicationDidEnterBackground(application)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        handler.applicationWillEnterForeground(application)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        handler.applicationDidBecomeActive(application)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        handler.applicationWillTerminate(application)
    }
}
