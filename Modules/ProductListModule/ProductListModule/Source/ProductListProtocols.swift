//
//  ProductListProtocols.swift
//  ProductListModule
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation
import ViewControllerAbleKit
typealias Ables = NavConUIAble & UIViewAble & SegueAble

protocol ViewToPresenterProductListProtocol {
    var view : PresenterToViewProductListProtocol? {get}
    func viewDidLoad()
    func getSubCategoryId(subCategoryId:Int)
    func searchProductList(searchText:String?)
    
    func numberOfItemsInSection() -> Int
    func collectionViewCellForItem(at indexPath:IndexPath)-> (product:ProductResult,radius:Double,backColor:String)
    func insetForSectionAt() -> (top:CGFloat,left:CGFloat,right:CGFloat,bottom:CGFloat)
    func minimumLineSpacingForSectionAt() -> CGFloat
    func minimumInteritemSpacingForSectionAt() -> CGFloat
    func didSelectItemAt(at indexPath:IndexPath)
    func sortAscendingPrice()
    func sortDescendingPrice()
    
}


protocol PresenterToViewProductListProtocol:AnyObject & Ables{
    func prepareCollectionView()
    func reloadCollectionView()
    func searchTextFieldPlacholder(placholderText:String)
}


protocol PresenterToInteractorProductListProtocol {
    func fetchSmartPhoneProducts() async
    func fetchLaptopProducts() async 
    func fetchTshirtsProducts() async
    func fetchJumpersProducts() async
    
}


protocol InteractorToPresenterProductListProtocol {
    func sendData(resultData:[ProductResult])
}


protocol PresenterToRouserProductListProtocol {
    func toProductDetailModule(view:PresenterToViewProductListProtocol?,id:Int,product_id:Int)
}


