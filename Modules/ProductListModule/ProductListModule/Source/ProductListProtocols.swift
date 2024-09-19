//
//  ProductListProtocols.swift
//  ProductListModule
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation

// tableview relaod section all vb
protocol ViewToPresenterProductListProtocol {
    var view : PresenterToViewProductListProtocol? {get}
    func viewDidLoad()
    func getSubCategoryId(subCategoryId:Int)
    
}

//prepare
protocol PresenterToViewProductListProtocol:AnyObject{
    
    func reloadCollectionView()
   
}

//ProductListInteractor:
protocol PresenterToInteractorProductListProtocol {
  
}

// to presenter send Data
protocol InteractorToPresenterProductListProtocol {
  
}

//Router:
protocol PresenterToRouserProductListProtocol {
    
}


