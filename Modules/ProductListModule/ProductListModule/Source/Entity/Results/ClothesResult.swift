//
//  Clothes.swift
//  ProductListModule
//
//  Created by Engin Gülek on 19.09.2024.
//

import Foundation

class ClothesResult: ProductResult {
    let color_id: Int
    
    init(id: Int, imageurl: [String], name: String, price: Int, color_id: Int) {
        self.color_id = color_id
        super.init(id: id, imageurl: imageurl, name: name, price: price)
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.color_id = try container.decode(Int.self, forKey: .color_id)
        try super.init(from: decoder) 
    }
    
    enum CodingKeys: String, CodingKey {
        case color_id
    }
}

