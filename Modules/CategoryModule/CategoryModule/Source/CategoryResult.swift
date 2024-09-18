//
//  CategoryResult.swift
//  CategoryModule
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation

struct CategoryResult : Decodable {
    let id:Int
    let name:String
    let icon:String
    let subCategories:[SubCategories]
}


struct SubCategories : Decodable {
    let id:Int
    let name:String
    let icon:String
}
