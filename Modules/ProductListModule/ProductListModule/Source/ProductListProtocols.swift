//
//  ProductListProtocols.swift
//  ProductListModule
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation
import ViewControllerAbleKit
typealias Ables = NavConUIAble
// tableview relaod section all vb
protocol ViewToPresenterProductListProtocol {
    var view : PresenterToViewProductListProtocol? {get}
    func viewDidLoad()
    func getSubCategoryId(subCategoryId:Int)
    func numberOfItemsInSection() -> Int
    func collectionViewCellForItem(at indexPath:IndexPath)-> BaseProduct
   // func didSelectItemAt(at indexPath:IndexPath)
    
}

//prepare
protocol PresenterToViewProductListProtocol:AnyObject & Ables{
    
    func reloadCollectionView()
   
}

//ProductListInteractor:
protocol PresenterToInteractorProductListProtocol {
    func fetchSmartPhoneProducts() async
    func fetchLaptopProducts() async 
    
}

// to presenter send Data
protocol InteractorToPresenterProductListProtocol {
    func sendDataSmartPhonesProduct(resultData:[ElectronicResult<Size,Color>])
    func sendDataLaptopsProduct(resultData:[ElectronicResult<Size,Int>])
}

//Router:
protocol PresenterToRouserProductListProtocol {
    
}


