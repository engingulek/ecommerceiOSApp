//
//  ProductListProtocols.swift
//  ProductListModule
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation

protocol ViewToPresenterCategoryProtocol {
    var view : PresenterToViewCategoryProtocol? {get}
    func viewDidLoad()
    
}

protocol PresenterToViewCategoryProtocol:AnyObject{
    func prepareCollectionView()
    func reloadCollectionView()
   
}


protocol PresenterToInteractorCategoryProtocol {
  
}


protocol InteractorToPresenterCategoryProtocol {
  
}


