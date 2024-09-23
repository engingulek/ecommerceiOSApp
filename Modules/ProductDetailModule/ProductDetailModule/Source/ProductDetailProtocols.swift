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
    func collectionViewCellForItem(at indexPath:IndexPath,tag:Int)-> (text:String,())
    
    
}


protocol PresenterToViewProductDetailProtocol : AnyObject & Ables{
    func prepareCollectionView()
    func reloadCollectionView()
    
}

/// fetch
protocol PresenterToInteractorProductDetailProtocol{
    func fetchColor() async
    func fetchMemorySize() async
    
}

// send data
protocol InteractorToPresenterProductDetailProtocol{
    func sendColor(colors:[ColorResult])
    func sendMemorySize(memorySizes:[MemorySizeResult])
}


protocol PresenterToRouserProductDetailProtocol{
    
}
