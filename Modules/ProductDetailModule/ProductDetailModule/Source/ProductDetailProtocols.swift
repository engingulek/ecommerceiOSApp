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
    
    
}


protocol PresenterToViewProductDetailProtocol : AnyObject & Ables{
    func prepareCollectionView()
    func reloadCollectionView()
   
}

/// fetch
protocol PresenterToInteractorProductDetailProtocol{
  
    
}

// send data
protocol InteractorToPresenterProductDetailProtocol{
   
}


protocol PresenterToRouserProductDetailProtocol{
    
}
