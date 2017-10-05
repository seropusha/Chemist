//
//  AppDelegateHandler.swift
//  Chemist
//
//  Created by Sergey Navka on 10/5/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

struct AppDelegateHandler {
    
    let items: [UIApplicationDelegate]
    
    init(items: [UIApplicationDelegate]) {
        self.items = items
    }
}

extension AppDelegateHandler {
    
    mutating func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        items.forEach{ let _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions) }
        return true
    }
    
    mutating func applicationWillResignActive(_ application: UIApplication) {
        items.forEach{ $0.applicationWillResignActive?(application) }
    }
    
    mutating func applicationDidEnterBackground(_ application: UIApplication) {
        items.forEach{ $0.applicationDidEnterBackground?(application) }
    }
    
    mutating func applicationWillEnterForeground(_ application: UIApplication) {
        items.forEach{ $0.applicationWillEnterForeground?(application) }
    }
    
    mutating func applicationDidBecomeActive(_ application: UIApplication) {
        items.forEach{ $0.applicationDidBecomeActive?(application) }
    }
    
    mutating func applicationWillTerminate(_ application: UIApplication) {
        items.forEach{ $0.applicationWillTerminate?(application) }
    }
}
