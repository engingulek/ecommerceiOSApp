//
//  Color.swift
//  ProductListModule
//
//  Created by Engin Gülek on 19.09.2024.
//

import Foundation

class Color : Decodable {
    let id:Int
    let name:String
    
    enum CodingKeys: CodingKey {
        case id
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
}
