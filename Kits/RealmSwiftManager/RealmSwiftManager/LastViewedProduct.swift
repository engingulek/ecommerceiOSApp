//
//  LastViewedProduct.swift
//  RealmSwiftManager
//
//  Created by Engin Gülek on 23.09.2024.
//

import Foundation
import RealmSwift

class LastViewedProduct : Object {
    @objc dynamic  var id:Int = 0
    @objc dynamic  var imageUrl:String = ""
    @objc dynamic  var name:String  = ""
    @objc dynamic  var price : Int = 0
    
    public  override static func primaryKey() -> String? {
        return "id"
    }
}



public struct LastViewedProductResult  {
    public let id:Int
    public let imageUrl:String
    public let name:String
    public let price : Int
    
    
}


