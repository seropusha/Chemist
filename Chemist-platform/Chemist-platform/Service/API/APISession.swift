//
//  APISession.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation
import Moya
import ReactiveSwift
import Result

//MARK: Errors
enum APIError: Error {
    case deserialization(Error)
}

//MARK: - Progress struct

public struct Progress<T> {
    let progress: Foundation.Progress?
    let response: T?

    public var progressValue: Double {
        return progress?.fractionCompleted ?? 1.0
    }
    public var completed: Bool {
        return progressValue == 1.0 && response != nil
    }
}

//MARK: - Response Deserialization

protocol APIDeserialization {
    func deserialize(_ data: Data) throws -> [AnyHashable:Any]
}

struct ResponseDeserialization: APIDeserialization {
    func deserialize(_ data: Data) throws -> [AnyHashable:Any] {
        do {
            guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [AnyHashable:Any] else {
                throw APIError.deserialization(NSError(domain: "com.chemist-platform.deserialization.error", code: -1000, userInfo: nil))
            }
            return json
        } catch let parsingError {
            throw APIError.deserialization(parsingError)
        }
    }
}

//MARK: - API Client

protocol APISession {
    func request<T: JSONable>(_ target: MultiTarget) -> SignalProducer<T, AnyError>
    func request<T: JSONable>(_ target: MultiTarget, queue: DispatchQueue?) -> SignalProducer<T, AnyError>
    func requestWithProgress<T: JSONable>(_ target: MultiTarget, queue: DispatchQueue?) -> SignalProducer<Progress<T>, AnyError>
}

class APIClient: APISession {
    
    let provider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(verbose: true)])
    var deseriazlizationDelegate: APIDeserialization!
    
    init() {
        deseriazlizationDelegate = ResponseDeserialization()
    }
    
    func request<T: JSONable>(_ target: MultiTarget) -> SignalProducer<T, AnyError> {
        return request(target, queue: nil)
    }
    
    func request<T: JSONable>(_ target: MultiTarget, queue: DispatchQueue?) -> SignalProducer<T, AnyError> {
        return SignalProducer<T, AnyError> { [weak self] observer, lifetime in
            guard let strongSelf = self else { return }
            strongSelf.provider.reactive.request(target, callbackQueue: queue)
                .take(during: lifetime)
                .startWithResult{ result in
                    switch result {
                    case let .success(response):
                        do {
                            let json = try strongSelf.deseriazlizationDelegate.deserialize(response.data)
                            observer.send(value: T(json))
                            observer.sendCompleted()
                        } catch let deserializeError {
                            observer.send(error: AnyError(deserializeError))
                        }
                    case let .failure(moyaError):
                        observer.send(error: AnyError(moyaError))
                    }
                }
        }
    }
    func requestWithProgress<T: JSONable>(_ target: MultiTarget, queue: DispatchQueue?) -> SignalProducer<Progress<T>, AnyError> {
        return SignalProducer<Progress<T>, AnyError> { [weak self] observer, lifetime in
            guard let strongSelf = self else { return }
            strongSelf.provider.reactive.requestWithProgress(target, callbackQueue: queue)
                .take(during: lifetime)
                .startWithResult { result in
                    switch result {
                    case let .success(moyaProgress):
                        if moyaProgress.completed {
                            var object: T?
                            do {
                                if let data = moyaProgress.response?.data,
                                    let json = try self?.deseriazlizationDelegate.deserialize(data) {
                                    object = T(json)
                                }
                            } catch let deserializeError {
                                observer.send(error: AnyError(deserializeError))
                            }
                            observer.send(value: Progress(progress: moyaProgress.progressObject, response: object))
                            observer.sendCompleted()
                        } else {
                            observer.send(value: Progress(progress: moyaProgress.progressObject, response: nil))
                        }
                    case let .failure(moyaError):
                        observer.send(error: AnyError(moyaError))
                    }
            }
        }
    }
}
