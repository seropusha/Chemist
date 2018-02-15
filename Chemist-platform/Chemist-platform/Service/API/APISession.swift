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

//MARK: - API Client

protocol APISession {
    func request<T: Decodable>(_ target: MultiTarget) -> SignalProducer<T, AnyError>
    func request<T: Decodable>(_ target: MultiTarget, queue: DispatchQueue?) -> SignalProducer<T, AnyError>
    func requestWithProgress<T: Decodable>(_ target: MultiTarget, queue: DispatchQueue?) -> SignalProducer<Progress<T>, AnyError>
}

class APIClient: APISession {
    
    let provider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func request<T: Decodable>(_ target: MultiTarget) -> SignalProducer<T, AnyError> {
        return request(target, queue: nil)
    }
    
    func request<T: Decodable>(_ target: MultiTarget, queue: DispatchQueue?) -> SignalProducer<T, AnyError> {
        return SignalProducer<T, AnyError> { [weak self] observer, lifetime in
            guard let strongSelf = self else { return }
            strongSelf.provider.reactive.request(target, callbackQueue: queue)
                .take(during: lifetime)
                .startWithResult{ result in
                    switch result {
                    case let .success(response):
                        do {
                            observer.send(value: try JSONDecoder().decode(T.self, from: response.data))
                            observer.sendCompleted()
                        } catch let error {
                            observer.send(error: AnyError(error))
                        }
                    case let .failure(moyaError):
                        observer.send(error: AnyError(moyaError))
                    }
                }
        }
    }
    func requestWithProgress<T: Decodable>(_ target: MultiTarget, queue: DispatchQueue?) -> SignalProducer<Progress<T>, AnyError> {
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
                                if let data = moyaProgress.response?.data {
                                    object = try JSONDecoder().decode(T.self, from: data)
                                }
                            } catch let error {
                                observer.send(error: AnyError(error))
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
