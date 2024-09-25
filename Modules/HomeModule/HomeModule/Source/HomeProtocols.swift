//
//  HomeProtocols.swift
//  HomeModule
//
//  Created by Engin Gülek on 17.09.2024.
//

import Foundation
import ViewControllerAbleKit
import RealmSwiftManager
 typealias Ables = UIViewAble & SegueAble & NavConUIAble & AlertMessageAble

protocol PresenterToViewHomeProtocol:AnyObject,Ables{
    
    func prepareCollectionView()
    func reloadCollectionView()
    func setEmptyMessageLabel(text:String)
    

}


protocol ViewToPresenterHomeProtocol {
    var view : PresenterToViewHomeProtocol? {get}
    func viewDidLoad()
    func viewWillAppear()
    func numberOfItemsInSection() -> Int
    func collectionViewCellForItem(at indexPath:IndexPath)-> (product:LastViewedProductResult,radius:Double,backColor:String)
    func insetForSectionAt() -> (top:CGFloat,left:CGFloat,right:CGFloat,bottom:CGFloat)
    func minimumLineSpacingForSectionAt() -> CGFloat
    func minimumInteritemSpacingForSectionAt() -> CGFloat
    
    func categoriesButtonOnTapped()
    

}


protocol PresenterToRouterHomeProtocol {
    func toCategoryModule(view:PresenterToViewHomeProtocol?)
}
