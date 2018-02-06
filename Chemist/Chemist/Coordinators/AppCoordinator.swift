//
//  AppCoordinator.swift
//  Chemist
//
//  Created by Sergey Navka on 10/5/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import UIKit

/// The AppCoordinator is our first coordinator
/// In this example the AppCoordinator as a rootViewController
class AppCoordinator: RootViewCoordinator {
    
    //MARK: - Properties
    let window: UIWindow
    let services: Services
    var childCoordinators: [Coordinator] = []
    
    var rootViewController: UIViewController {
        return UIViewController()
    }
    
    //MARK: - Initialization
    public init(window: UIWindow, services: Services) {
        self.services = services
        self.window = window
        self.window.rootViewController = self.rootViewController
    }
    
    //MARK: - Methods
    public func start() {
        //TODO: Load first controller
    }

}
