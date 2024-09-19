//
//  Size.swift
//  ProductListModule
//
//  Created by Engin Gülek on 19.09.2024.
//

import Foundation

class Size: Decodable {
    let id:Int
    let size:String
    
    enum CodingKeys: CodingKey {
        case id
        case size
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.size = try container.decode(String.self, forKey: .size)
    }
}
