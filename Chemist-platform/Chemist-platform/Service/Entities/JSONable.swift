//
//  JSONable.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/9/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation

protocol JSONable {
    init(_ json: [AnyHashable: Any])
}
