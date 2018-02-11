//
//  RemedyAPI.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/11/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Moya

public enum RemedyAPI {
    
    public enum SearchType: String {
        case substance
        case manufatured
        case type
        case farmType
        case farmGroup
    }
    
    case getSlice(limit: Int, offset: Int) // CREATE SLICES
    case getByID(Int)
    case getFullByID(Int)
    case getRandom(Int)
    case search(String, SearchType?)
}


extension RemedyAPI: TargetType {
    public var baseURL: URL { return Environment.current.baseURL }
    public var path: String {
        switch self {
        case let .getByID(id):
            return "remedy/\(id)"
        case .getSlice:
            return "remedy"
        case .getRandom:
            return "remedy"
        case let .getFullByID(id):
            return "remedy/\(id)" //NEED MAKE GETTING FULL OBJECT
        case .search:
            return "remedy"
        }
    }
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Task {
        switch self {
        case .getByID:
            return .requestPlain
        case let .getSlice(limit, offset):
            return .requestParameters(parameters: ["limit": limit,
                                                   "offset": offset], encoding: URLEncoding.default)
        case let .getRandom(count):
            return .requestParameters(parameters: ["randomCount": count], encoding: URLEncoding.default)
        case .getFullByID:
            return .requestPlain
        case let .search(text, type):
            return .requestParameters(parameters: ["search": text,
                                                   "type" : type?.rawValue ?? "title"], encoding: URLEncoding.default)
        }
    }
    public var validationType: ValidationType {
        switch self {
        default:
            return .successCodes
        }
    }
    //TODO ADD CUStOM RESPONSE
    public var sampleData: Data {
        switch self {
        case .getByID:
            return "".data(using: .utf8)!
        case .getSlice:
            return "".data(using: .utf8)!
        case .getRandom:
            return "".data(using: .utf8)!
        case .getFullByID:
            return "".data(using: .utf8)!
        case .search:
            return "".data(using: .utf8)!
        }
    }
    public var headers: [String: String]? {
        return nil
    }
}
