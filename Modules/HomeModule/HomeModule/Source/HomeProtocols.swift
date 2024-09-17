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
}


protocol ViewToPresenterHomeProtocol {
    var view : PresenterToViewHomeProtocol? {get}
    func viewDidLoad()
    func searchTextFieldDidChange(text:String?)
    func categoriesButtonOnTapped()
}


protocol PresenterToRouterHomeProtocol {
    func toCategoryModule(view:PresenterToViewHomeProtocol?)
}
