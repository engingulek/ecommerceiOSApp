//
//  ProductListRouter.swift
//  ProductListModule
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation
import UIKit

public class ProductListRouter : ProductListModuleProtocol {
    
    public init() {}
    
    public func createProductListModule(subCategoryId: Int) -> UICollectionViewController {
        let view = ProductListCollectionView()
        print(subCategoryId)
        return view
    }
    
    
 
}



