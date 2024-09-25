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
    case colors
    case memorySizes
    case getSmartPhoneDetail(Int,Int)
    case getInventoryByProductId(Int)
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
        case .colors:
            Constants.product.rawValue + Constants.getColors.rawValue
        case .memorySizes:
            Constants.product.rawValue + Constants.getMemorySizes.rawValue
        case .getSmartPhoneDetail(let id, let product_id):
            Constants.product.rawValue + Constants.getSmartPhoneDetail.rawValue + "id=\(id)&product_id=\(product_id)"
        case .getInventoryByProductId(let product_id):
            Constants.inventory.rawValue + Constants.getInventoryByProductId.rawValue + "productId=\(product_id)"
            
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
