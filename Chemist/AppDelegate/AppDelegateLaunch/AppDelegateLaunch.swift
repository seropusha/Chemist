//
//  AppDelegateLaunch.swift
//  Chemist
//
//  Created by Sergey Navka on 10/5/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

class AppDelegateLaunch: NSObject, UIApplicationDelegate {
    
    private(set) var applicationWindow: UIWindow!
    private(set) var appCoordinator: AppCoordinator!
    
    override init() {
        applicationWindow = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: applicationWindow, services: NSObject())
        super.init()
    }
}

//MARK: - UIApplicationDelegate
extension AppDelegateLaunch {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        appCoordinator.start()
        return true
    }
}
