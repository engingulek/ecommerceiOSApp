//
//  CategoryProtocols.swift
//  CategoryModule
//
//  Created by Engin Gülek on 17.09.2024.
//

import Foundation
import ViewControllerAbleKit
typealias Ables = UIViewAble & NavConUIAble & SegueAble & AlertMessageAble


protocol ViewToPresenterCategoryProtocol {
    var view : PresenterToViewCategoryProtocol? {get}
    func viewDidLoad()
    /// TableView
    func numberOfRowsInSection() -> Int
    func cellForItem(at indexPath : IndexPath) -> (text:String,textColor:String,backColor:String)
    func didSelectRow(at indexPath:IndexPath)
    /// Collection View
    func numberOfItemsInSection() -> Int
    func specialViewOnTapped()
    func collectionViewCellForItem(at indexPath:IndexPath)-> SubCategories
    func didSelectItemAt(at indexPath:IndexPath)
    
}

protocol PresenterToViewCategoryProtocol:AnyObject,Ables{
    /// Collection View
    func prepareCollectionView()
    func reloadSubCategoryCollectionView()
    /// TableView
    func prepareTableView()
    func reloadCategoryTableView()
    
    func speacialViewChangeUI(textColor:String,backColor:String)
    func setEmptyMessageForYou(text:String)
}


protocol PresenterToInteractorCategoryProtocol {
    func fetchCategories() async throws
}


protocol InteractorToPresenterCategoryProtocol {
    func sendData(categoryResult:[CategoryResult])
}


protocol PresenterToRouteCategoryProtocol {
    func toProductListModule(view:PresenterToViewCategoryProtocol?,subCategoryId:Int)
}
