//
//  CategoryProtocols.swift
//  CategoryModule
//
//  Created by Engin Gülek on 17.09.2024.
//

import Foundation
import ViewControllerAbleKit
typealias Ables = UIViewAble & NavConUIAble


protocol ViewToPresenterCategoryProtocol {
    var view : PresenterToViewCategoryProtocol? {get}
    func viewDidLoad()
    func numberOfRowsInSection() -> Int
    func cellForItem(at indexPath : IndexPath) -> String
    
}

protocol PresenterToViewCategoryProtocol:AnyObject,Ables{
    func prepareCollectionView()
    func prepareTableView()
    func reloadCategoryTableView()
    func reloadSubCategoryCollectionView()
}


protocol PresenterToInteractorCategoryProtocol {
    func fetchCategories() async throws
}


protocol InteractorToPresenterCategoryProtocol {
    func sendData(categoryResult:[CategoryResult])
}
