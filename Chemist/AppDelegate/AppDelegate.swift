//
//  AppDelegate.swift
//  Chemist
//
//  Created by Valeriya Ponamarenko on 8/30/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var handler: AppDelegateHandler = AppDelegateHandler()

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

