//
//  Reactive+Extension.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/23/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Chemist_domain
import Moya
import ReactiveSwift
import CoreData

extension SignalProducer {
    func wait<T>(completed producer: SignalProducer<T, Error>) -> SignalProducer<Value, Error> {
        return flatMap(.latest) { producer.then(.init(value: $0)) }
    }
}

extension SignalProducerProtocol where Error == MoyaError {
    func mapToDomainError() -> SignalProducer<Value, DomainError> {
        return producer.mapError { moyaError in
            switch moyaError {
            case let .underlying(error, response):
                guard let response = response else {
                    return .underlying(error)
                }
                do {
                    let apiResponseError = try JSONDecoder().decode(APIResponseError.self, from: response.data)
                    return .underlying(apiResponseError)
                } catch let error {
                    return .decodable(error)
                }
            case let .objectMapping(error, _):
                return .decodable(error)
            default:
                return .underlying(moyaError)
            }
        }
    }
}

extension SignalProducerProtocol where Error == DomainError {
    func attemptMap<U>(_ transform: @escaping (Value) throws -> U) -> SignalProducer<U, Error> {
        return producer.attemptMap {
            do {
                return .success(try transform($0))
            } catch let error {
                return .failure(.underlying(error))
            }
        }
    }
}

extension SignalProducerProtocol where Error == MoyaError {
    func attemptMap<U>(_ transform: @escaping (Value) throws -> U) -> SignalProducer<U, DomainError> {
        return producer
            .mapToDomainError()
            .attemptMap { try transform($0) }
    }
}
