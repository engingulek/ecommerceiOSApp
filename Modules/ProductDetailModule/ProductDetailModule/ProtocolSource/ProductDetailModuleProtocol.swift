//
//  ProductDetailModuleProtocol.swift
//  ProductDetailModule
//
//  Created by Engin Gülek on 23.09.2024.
//

import Foundation
import UIKit

public protocol ProductDetailModuleProtocol {
    func createProductListModule(id:Int,product_id:Int) -> UIViewController
}
