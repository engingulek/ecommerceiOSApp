//
//  ElectronicResult.swift
//  ProductListModule
//
//  Created by Engin Gülek on 19.09.2024.
//

import Foundation

class SmartPhoneResult : ProductResult {
    let feature_one:Size
    let feature_tow:Color
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.feature_one = try container.decode(Size.self, forKey: .feature_one)
        self.feature_tow = try container.decode(Color.self, forKey: .feature_tow)
        try super.init(from: decoder)
    }
    
    enum CodingKeys: String, CodingKey {
        case feature_one
        case feature_tow
    }
    
}








