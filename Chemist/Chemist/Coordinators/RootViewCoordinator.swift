//
//  RootCoordinator.swift
//  Chemist
//
//  Created by Sergey Navka on 10/5/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import UIKit

public protocol RootViewControllerProvider: class {
    // The coordinators 'rootViewController'. It helps to think of this as the view
    // controller that can be used to dismiss the coordinator from the view hierarchy.
    var rootViewController: UIViewController { get }
    
    /// Configure coordinator,
    /// Load first controller in flow in this method
    func start()
}

/// A Coordinator type that provides a root UIViewController
public typealias RootViewCoordinator = Coordinator & RootViewControllerProvider

