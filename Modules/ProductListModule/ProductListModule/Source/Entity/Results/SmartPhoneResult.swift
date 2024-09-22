//
//  ElectronicResult.swift
//  ProductListModule
//
//  Created by Engin Gülek on 19.09.2024.
//

import Foundation

class SmartPhoneResult : ProductResult {
    let memory_size_id:Int
    let color_id:Int
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.memory_size_id = try container.decode(Int.self, forKey: .memory_size_id)
        self.color_id = try container.decode(Int.self, forKey: .color_id)
        try super.init(from: decoder)
    }
    
    enum CodingKeys: String, CodingKey {
        case memory_size_id
        case color_id
    }
    
}








