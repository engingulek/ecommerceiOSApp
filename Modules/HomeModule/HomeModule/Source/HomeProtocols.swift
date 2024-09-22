//
//  HomeProtocols.swift
//  HomeModule
//
//  Created by Engin Gülek on 17.09.2024.
//

import Foundation
import ViewControllerAbleKit
 typealias Ables = UIViewAble & SegueAble & NavConUIAble

protocol PresenterToViewHomeProtocol:AnyObject,Ables{
    func prepareSearchBar()
    func prepareCollectionView()
    func reloadCollectionView()
    func searchTextFieldPlaceholder(placeholder:String)
    func clearSearchText()
}


protocol ViewToPresenterHomeProtocol {
    var view : PresenterToViewHomeProtocol? {get}
    func viewDidLoad()
    func viewWillAppear()
    func searchTextFieldDidChange(text:String?)
    func categoriesButtonOnTapped()

}


protocol PresenterToRouterHomeProtocol {
    func toCategoryModule(view:PresenterToViewHomeProtocol?)
    func toSearchProductListModule(view:PresenterToViewHomeProtocol?,text:String)
}
