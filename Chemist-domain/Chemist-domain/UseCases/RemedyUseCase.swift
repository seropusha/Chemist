//
//  RemedyUseCase.swift
//  Chemist-domain
//
//  Created by Sergey Navka on 2/22/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

public protocol RemedyUseCase {
//    func fetchRemedies(_ slice: Slice<Remedy>) -> SignalProducer<Slice<Remedy>, AnyError>
    func fetchRemedy(at index: Int) -> SignalProducer<Remedy, AnyError>
    func fetchRemedyDescription(at index: Int) -> SignalProducer<RemedyDescription, AnyError>
}
