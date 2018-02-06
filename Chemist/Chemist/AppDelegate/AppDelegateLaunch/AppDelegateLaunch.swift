//
//  AppDelegateLaunch.swift
//  Chemist
//
//  Created by Sergey Navka on 10/5/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

/// First delegate item,
/// which setup start coordinator, window make key and wisible with start controller and make services injection 
class AppDelegateLaunch: NSObject, UIApplicationDelegate {
    
    let startWindow: UIWindow
    let appCoordinator: AppCoordinator
    
    init(window: UIWindow) {
        startWindow = window
        appCoordinator = AppCoordinator(window: window, services: Services())
        super.init()
    }
}

//MARK: - UIApplicationDelegate
extension AppDelegateLaunch {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        appCoordinator.start()
        startWindow.makeKeyAndVisible()
        return true
    }
}
