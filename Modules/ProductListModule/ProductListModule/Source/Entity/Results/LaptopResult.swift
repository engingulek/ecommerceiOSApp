//
//  LaptopResult.swift
//  ProductListModule
//
//  Created by Engin Gülek on 19.09.2024.
//

import Foundation
class LaptopResult : ProductResult {
    let feature_one:Size
    let feature_tow:Int
    
    init(id: Int, imageurl: [String], name: String, price: Int,size: Size, feature_tow: Int) {
        self.feature_one = size
        self.feature_tow = feature_tow
        super.init(id: id, imageurl: imageurl, name: name, price: price)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.feature_one = try container.decode(Size.self, forKey: .feature_one)
        self.feature_tow = try container.decode(Int.self, forKey: .feature_tow)
        try super.init(from: decoder) 
    }
    
    enum CodingKeys: String, CodingKey {
        case feature_one
        case feature_tow
    }
}
