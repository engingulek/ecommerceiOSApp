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
    
    func prepareCollectionView()
    func reloadCollectionView()
    

}


protocol ViewToPresenterHomeProtocol {
    var view : PresenterToViewHomeProtocol? {get}
    func viewDidLoad()
    
    
    func categoriesButtonOnTapped()

}


protocol PresenterToRouterHomeProtocol {
    func toCategoryModule(view:PresenterToViewHomeProtocol?)
    func toSearchProductListModule(view:PresenterToViewHomeProtocol?,text:String)
}
