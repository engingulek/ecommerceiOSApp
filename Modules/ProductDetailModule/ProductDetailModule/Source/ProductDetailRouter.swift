//
//  ProductDetailRouter.swift
//  ProductDetailModule
//
//  Created by Engin Gülek on 23.09.2024.
//

import Foundation
import UIKit

public class ProductDetailRouter : ProductDetailModuleProtocol {
    public init() {}
    public func createProductListModule(id: Int, product_id: Int) -> UIViewController {
        let view = ProductDetailViewController()
        print("\(id) - \(product_id)")
        return view
    }
    
    
}
