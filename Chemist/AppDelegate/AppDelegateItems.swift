//
//  AppDelegateItems.swift
//  Chemist
//
//  Created by Valeriya Ponamarenko on 10/18/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

/// Initialize app delegates items.
/// If need more functional in UIApplication callbacks create entity which support UIApplicationDelegate protocol and add in AppDelegateContainer as property, initialize it and return in items collection
struct AppDelegateContainer {
    let launchItem: AppDelegateLaunch
    
    var items: [UIApplicationDelegate] {
        return [launchItem]
    }
    
    init(window: UIWindow) {
        self.launchItem = AppDelegateLaunch(window: window)
    }
}
