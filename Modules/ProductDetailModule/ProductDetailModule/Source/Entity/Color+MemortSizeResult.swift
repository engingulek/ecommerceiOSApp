//
//  ColorResult.swift
//  ProductDetailModule
//
//  Created by Engin Gülek on 23.09.2024.
//

import Foundation


struct ColorResult : Decodable {
    let id:Int
    let name:String
}

struct MemorySizeResult : Decodable {
    let id:Int
    let size:String
}
