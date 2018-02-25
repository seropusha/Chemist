//
//  RemedyAPI.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/11/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Moya
import Chemist_domain

extension API {
    enum RemedyAPI: Request {
        
        public enum SearchType: String {
            case substance
            case manufatured
            case type
            case farmType
            case farmGroup
        }
        
   //     case getSlice(Slice<Remedy>)
        case get(id: Int)
        case getDescription(id: Int)
        case getRandom(Int)
        case search(String, SearchType?)
        
        var baseURL: URL { return Environment.current.baseURL }
        
        var path: String {
            switch self {
            case let .get(id: id):
                return "remedy/\(id)"
//            case .getSlice:
//                return "remedy"
            case .getRandom:
                return "remedy"
            case let .getDescription(id: id):
                return "remedyDescription/\(id)"
            case .search:
                return "remedy"
            }
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var task: Task {
            switch self {
            case .get(id:):
                return .requestPlain
//            case let .getSlice(slice):
//                //TODO configure parameters
//                return .requestPlain
            case let .getRandom(count):
                return .requestParameters(parameters: ["randomCount": count], encoding: URLEncoding.default)
            case .getDescription(id:):
                return .requestPlain
            case let .search(text, type):
                return .requestParameters(parameters: ["search": text,
                                                       "type" : type?.rawValue ?? "title"], encoding: URLEncoding.default)
            }
        }
        var validationType: ValidationType {
            return .successCodes
        }
        
        //TODO ADD CUSTOM RESPONSE
        var sampleData: Data {
            return "".data(using: .utf8)!
        }
        
        var headers: [String: String]? {
            return nil
        }
        
    }
}



