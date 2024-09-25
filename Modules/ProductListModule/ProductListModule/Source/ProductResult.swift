//
//  ProductResult.swift
//  ProductListModule
//
//  Created by Engin Gülek on 19.09.2024.
//

import Foundation


struct ProductResult : Decodable {
    let id: Int
    let product_id:Int
    let imageurl: [String]
    let name: String
    let price: Int
}
