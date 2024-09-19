//
//  ProductResult.swift
//  ProductListModule
//
//  Created by Engin Gülek on 19.09.2024.
//

import Foundation

class ProductResult : Decodable {
    let id: Int
    let imageurl: [String]
    let name: String
    let price: Int
    
    init(id: Int, imageurl: [String], name: String, price: Int) {
        self.id = id
        self.imageurl = imageurl
        self.name = name
        self.price = price
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.imageurl = try container.decode([String].self, forKey: .imageurl)
        self.name = try container.decode(String.self, forKey: .name)
        self.price = try container.decode(Int.self, forKey: .price)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageurl
        case name
        case price
    }
}
