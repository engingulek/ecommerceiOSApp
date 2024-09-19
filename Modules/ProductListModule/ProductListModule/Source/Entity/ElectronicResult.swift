//
//  ElectronicResult.swift
//  ProductListModule
//
//  Created by Engin Gülek on 19.09.2024.
//

import Foundation


struct ElectronicResult<T:Decodable,Y:Decodable> : Decodable {
    let id: Int
    let imageurl: [String]
    let name: String
    let price: Int
    let featureOne: T
    let featureTow: Y
    
    enum CodingKeys: String, CodingKey {
            case id, imageurl, name, price
            case featureOne = "feature_one"
            case featureTow = "feature_tow"
        }
}

struct Size: Decodable {
    let id:Int
    let size:String
}


struct Color : Decodable {
    let id:Int
    let name:String
}
