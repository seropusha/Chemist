//
//  AppDelegateLaunch.swift
//  Chemist
//
//  Created by Sergey Navka on 10/5/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

class AppDelegateLaunch: NSObject, UIApplicationDelegate {
    
    var applicationWindow: UIWindow!
    var appCoordinator: AppCoordinator!
}

//MARK: - UIApplicationDelegate
extension AppDelegateLaunch {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        self.applicationWindow = UIWindow(frame: UIScreen.main.bounds)
        self.appCoordinator = AppCoordinator(window: applicationWindow, services: NSObject())
        self.appCoordinator.start()
        return true
    }
}
