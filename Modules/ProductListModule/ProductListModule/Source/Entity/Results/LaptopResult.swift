//
//  LaptopResult.swift
//  ProductListModule
//
//  Created by Engin Gülek on 19.09.2024.
//

import Foundation
class LaptopResult : ProductResult {
    let memory_size_id:Int
    let ram_capacity:Int
    
    init(id: Int, imageurl: [String], name: String, price: Int,memory_size_id: Int, ram_capacity: Int) {
        self.memory_size_id = memory_size_id
        self.ram_capacity = ram_capacity
        super.init(id: id, imageurl: imageurl, name: name, price: price)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.memory_size_id = try container.decode(Int.self, forKey: .memory_size_id)
        self.ram_capacity = try container.decode(Int.self, forKey: .ram_capacity)
        try super.init(from: decoder)
    }
    
    enum CodingKeys: String, CodingKey {
        case memory_size_id
        case ram_capacity
    }
}
