//
//  ReachabilityService.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/25/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Chemist_domain
import ReactiveSwift
import Alamofire

protocol Reachability {
    var isReachable: Bool { get }
    var reachableStatus: Property<NetworkReachabilityManager.NetworkReachabilityStatus> { get }
}

final class ReachabilityService: Reachability {
    
    var isReachable: Bool = false
    lazy var reachableStatus = Property<NetworkReachabilityManager.NetworkReachabilityStatus>(self._reachableStatus)
    private var _reachableStatus: MutableProperty<NetworkReachabilityManager.NetworkReachabilityStatus> = .init(.notReachable)

    let reachabilityManager: NetworkReachabilityManager
    
    init() {
        reachabilityManager = NetworkReachabilityManager()!
        reachabilityManager.startListening()
        reachabilityManager.listener = { [weak self] status in
            guard let strongSelf = self else {
                return
            }
            strongSelf._reachableStatus.value = status
            strongSelf.isReachable = strongSelf.reachabilityManager.isReachable
        }
    }
}
