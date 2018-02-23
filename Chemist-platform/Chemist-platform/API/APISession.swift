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

public typealias Request = TargetType
public typealias Provider<T: Request> = MoyaProvider<T>

class APIClient {
    
    let manager: Manager
    
    init() {
        manager = SessionManager()
    }
    
    func getProvider<T: Request>() -> Provider<T> {
        return Provider<T>(manager: manager)
    }

}
