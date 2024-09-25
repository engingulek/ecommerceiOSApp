//
//  ProductDetailProtocols.swift
//  ProductDetailModule
//
//  Created by Engin Gülek on 23.09.2024.
//

import Foundation
import ViewControllerAbleKit
typealias Ables = NavConUIAble & UIViewAble & SegueAble

protocol ViewToPresenterProductDetailProtocol {
    var view : PresenterToViewProductDetailProtocol? {get}
    func viewDidLoad()
    func getProductInfo(id:Int,product_id:Int)
    func numberOfItemsInSection(tag:Int) -> Int
    func collectionViewCellForItem(at indexPath:IndexPath,tag:Int)-> (text:String,
                                                                      textColor:String,
                                                                      backColor:String,
                                                                      borderColor:String,
                                                                      multiplyIconIsHidden:Bool)

    func sizeForItemAt() -> CGSize
    
    
    
}


protocol PresenterToViewProductDetailProtocol : AnyObject & Ables{
    func prepareCollectionView()
    func reloadCollectionView()
    func configureData(baseImageUrl:String,name:String,price:Int,desc:String)
    func alertLabelSetText(text:String)
}

/// fetch
protocol PresenterToInteractorProductDetailProtocol{
    func fetchColor() async
    func fetchMemorySize() async
    func fetchProductDetail(id:Int,product_id:Int) async
    func fetchInventoryInfo(product_id:Int) async
    
}

// send data
protocol InteractorToPresenterProductDetailProtocol{
    func sendColor(colors:[ColorResult])
    func sendMemorySize(memorySizes:[MemorySizeResult])
    func sendProductDetail(productDetail:ProductDetailResult)
    func sendInventoryResult(inventorResult:[InventoryResult])
}


protocol PresenterToRouserProductDetailProtocol{
    
}
