//
//  InventoryResult.swift
//  ProductDetailModule
//
//  Created by Engin Gülek on 24.09.2024.
//

import Foundation

struct InventoryResult : Decodable {
    let id:String
    let color_id:Int
    let memory_size_id:Int
    let stock_quantity:Int
    
}
