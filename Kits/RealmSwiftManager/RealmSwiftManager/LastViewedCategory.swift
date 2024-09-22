//
//  LastViewedCategory.swift
//  RealmSwiftManager
//
//  Created by Engin Gülek on 22.09.2024.
//

import Foundation
import RealmSwift
class LastViewedCategory : Object {
    @objc dynamic var id : Int =  1
    @objc dynamic var name : String = ""
    @objc dynamic var imageUrl:String = ""
    
    public  override static func primaryKey() -> String? {
        return "id"
    }
}


public struct LastViewedCategoryResult {
    
    public let id:Int
    public  let name:String
    public  let imageUrl:String
}
