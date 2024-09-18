//
//  ProductListModuleProtocol.swift
//  ProductListModule
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation
import UIKit

public protocol ProductListModuleProtocol{
    func createProductListModule(subCategoryId:Int) -> UICollectionViewController
}
