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
    
    func addLastViewedProduct(id:Int,name:String,imageUrl:String,price:Int)
    func fetchLastViewedProduct() -> [LastViewedProductResult]
}


public class RealmSwiftManager :RealmSwiftManagerProtocol {
   
    
    public init(){ }
    public func addLastViewCategory(id:Int,name:String,imageUrl:String) {
        let realm = try! Realm()
        let lastViewedCategory = LastViewedCategory()
        lastViewedCategory.id = id
        lastViewedCategory.name = name
        lastViewedCategory.imageUrl = imageUrl
        if !categoryExists(withid: id) {
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
    
    func categoryExists(withid id: Int) -> Bool {
        let realm = try! Realm()
        let lastViewedCategory = realm.objects(LastViewedCategory.self)
        return lastViewedCategory.contains(where: { $0.id == id })
    }
    
    
    public func addLastViewedProduct(id: Int, name: String, imageUrl: String, price: Int) {
        let realm = try! Realm()
        let lastViewdProduct = LastViewedProduct()
        lastViewdProduct.id = id
        lastViewdProduct.name = name
        lastViewdProduct.imageUrl = imageUrl
        lastViewdProduct.price = price
        if !productExist(withId: id){
            try! realm.write({
                realm.add(lastViewdProduct)
            })
        }
    }
    
    public func fetchLastViewedProduct() -> [LastViewedProductResult] {
        let realm = try! Realm()
        
        let lastViewedProduct = realm.objects(LastViewedProduct.self)
        
        return lastViewedProduct.map { product in
            return LastViewedProductResult(id: product.id, imageUrl: product.imageUrl, name: product.name, price:product.price )
        }
    }
    
    func productExist(withId id:Int) -> Bool {
        let realm = try! Realm()
        let lastViewedProduct = realm.objects(LastViewedProduct.self)
        return lastViewedProduct.contains(where: { $0.id == id })
    }
    
    
}
