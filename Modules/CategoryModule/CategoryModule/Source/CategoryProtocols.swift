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
    func cellForItem(at indexPath : IndexPath) -> (text:String,textColor:String,backColor:String)
    func didSelectRow(at indexPath:IndexPath)
    func specialViewOnTapped()
    
}

protocol PresenterToViewCategoryProtocol:AnyObject,Ables{
    func prepareCollectionView()
    func prepareTableView()
    func reloadCategoryTableView()
    func reloadSubCategoryCollectionView()
    func speacialViewChangeUI(textColor:String,backColor:String)
}


protocol PresenterToInteractorCategoryProtocol {
    func fetchCategories() async throws
}


protocol InteractorToPresenterCategoryProtocol {
    func sendData(categoryResult:[CategoryResult])
}
