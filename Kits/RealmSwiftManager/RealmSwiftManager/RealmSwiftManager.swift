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
    func fetchLastViewedCategory() -> Result<[LastViewedCategoryResult], Error>
    
    func addLastViewedProduct(id:Int,name:String,imageUrl:String,price:Int)
    func fetchLastViewedProduct() -> Result<[LastViewedProductResult], Error>
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
    
    public func fetchLastViewedCategory() -> Result<[LastViewedCategoryResult], Error> {
        do {
            let realm = try Realm()
            
            let lastViewedCategories = realm.objects(LastViewedCategory.self)
            
            let categories = lastViewedCategories.map { category in
                LastViewedCategoryResult(id: category.id, name: category.name, imageUrl: category.imageUrl)
            }
            
            return .success(Array(categories))
        } catch {
            return .failure(error)
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
    
    
    public func fetchLastViewedProduct() -> Result<[LastViewedProductResult], Error> {
        do{
            let realm = try Realm()
            
            let lastViewedProduct = realm.objects(LastViewedProduct.self)
            
            let products = lastViewedProduct.map { product in
                return LastViewedProductResult(id: product.id, imageUrl: product.imageUrl, name: product.name, price:product.price )
            }
            return .success(Array(products))
        }catch{
            return .failure(error)
        }
    }
    
    
    func productExist(withId id:Int) -> Bool {
        let realm = try! Realm()
        let lastViewedProduct = realm.objects(LastViewedProduct.self)
        return lastViewedProduct.contains(where: { $0.id == id })
    }
    
    
}
