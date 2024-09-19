//
//  NetworkPath.swift
//  NetworkKit
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation

public enum NetworkPath {
    case categories
    case smartPhones
    case laptops
    case thirsts
    case jumpers
}



extension NetworkPath : TargetType {
    var baseURL: String {
        return Constants.baseUrl.rawValue
    }
    
    var path: String {
        switch self {
        case .categories:
            Constants.category.rawValue + Constants.getAll.rawValue
        case .smartPhones:
            Constants.product.rawValue + Constants.getSmartPhones.rawValue
        case .laptops:
            Constants.product.rawValue + Constants.getLaptops.rawValue
        case .thirsts:
            Constants.product.rawValue + Constants.getThirsts.rawValue
        case .jumpers:
            Constants.product.rawValue + Constants.getJumpers.rawValue
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
