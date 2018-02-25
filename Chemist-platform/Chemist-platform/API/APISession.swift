//
//  APISession.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation
import Moya
import Alamofire

typealias Request = TargetType
typealias Provider<T: Request> = MoyaProvider<T>

class APIClient {
    
    let manager: Manager
    let reachability: Reachability

    init(_ reachability: Reachability) {
        manager = SessionManager()
        self.reachability = reachability
    }
    
    func getProvider<T: Request>() -> Provider<T> {
        return Provider<T>(manager: manager)
    }

}
