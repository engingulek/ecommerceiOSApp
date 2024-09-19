//
//  ProductListProtocols.swift
//  ProductListModule
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation
import ViewControllerAbleKit
typealias Ables = NavConUIAble & UICollectionViewControllerAble

protocol ViewToPresenterProductListProtocol {
    var view : PresenterToViewProductListProtocol? {get}
    func viewDidLoad()
    func getSubCategoryId(subCategoryId:Int)
    func numberOfItemsInSection() -> Int
    func collectionViewCellForItem(at indexPath:IndexPath)-> BaseProduct
    
}


protocol PresenterToViewProductListProtocol:AnyObject & Ables{
    
    func reloadCollectionView()
   
}


protocol PresenterToInteractorProductListProtocol {
    func fetchSmartPhoneProducts() async
    func fetchLaptopProducts() async 
    func fetchTshirtsProducts() async
    func fetchJumpersProducts() async
    
}


protocol InteractorToPresenterProductListProtocol {
    func sendData(resultData:[BaseProduct])
}


protocol PresenterToRouserProductListProtocol {
    
}


