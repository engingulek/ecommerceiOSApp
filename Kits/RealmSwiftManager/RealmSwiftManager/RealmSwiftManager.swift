//
//  RealmSwiftManager.swift
//  RealmSwiftManager
//
//  Created by Engin Gülek on 22.09.2024.
//

import Foundation

import RealmSwift

public protocol RealmSwiftManagerProtocol {
    func addLastViewCategory(id:Int,name:String,imageUrl:String)
    func fetchLastViewedCategory() -> [LastViewedCategoryResult]
}


public class RealmSwiftManager :RealmSwiftManagerProtocol {
    public init(){ }
    public func addLastViewCategory(id:Int,name:String,imageUrl:String) {
        let realm = try! Realm()
        let lastViewedCategory = LastViewedCategory()
        lastViewedCategory.id = id
        lastViewedCategory.name = name
        lastViewedCategory.imageUrl = imageUrl
        if !productExists(withName: id) {
            try! realm.write({
                realm.add(lastViewedCategory)
            })
        }
        
    }
    
    public func fetchLastViewedCategory()  -> [LastViewedCategoryResult]{
        let realm = try! Realm()
        
        let lastViewedCategories = realm.objects(LastViewedCategory.self)
        
        return lastViewedCategories.map { category in
            return LastViewedCategoryResult(id: category.id, name: category.name, imageUrl: category.imageUrl)
        }
    }
    
    func productExists(withName id: Int) -> Bool {
        let realm = try! Realm()
        let lastViewedCategory = realm.objects(LastViewedCategory.self)
        return lastViewedCategory.contains(where: { $0.id == id })
    }
    
    
}
