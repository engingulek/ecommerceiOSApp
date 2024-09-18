//
//  NetworkPath.swift
//  NetworkKit
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation

enum NetworkPath {
    case categories
}



extension NetworkPath : TargetType {
    var baseURL: String {
        return Constants.baseUrl.rawValue
    }
    
    var path: String {
        switch self {
        case .categories:
            Constants.category.rawValue + Constants.getAll.rawValue
        }
    }
    
    var method: AlamofireMethod {
        switch self {
        default:
            return .GET
            
        }
    }
    
    var requestType: RequestType {
        switch self {
        default:
            return .requestPlain
            
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
    
}
