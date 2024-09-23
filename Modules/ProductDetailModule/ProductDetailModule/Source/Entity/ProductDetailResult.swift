//
//  DetailResult.swift
//  ProductDetailModule
//
//  Created by Engin Gülek on 24.09.2024.
//

import Foundation

struct ProductDetailResult : Decodable {
    let id:Int
    let product_id:Int
    let name:String
    let imageurl:[String]
    let description:String
    let price: Int
    let color_id:Int
    let memory_size_id:Int
    
}
