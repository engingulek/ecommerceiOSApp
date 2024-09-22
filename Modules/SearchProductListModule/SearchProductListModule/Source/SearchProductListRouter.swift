//
//  SearchProductListRouter.swift
//  SearchProductListModule
//
//  Created by Engin Gülek on 22.09.2024.
//

import Foundation
import UIKit

public class SearchProductListRouter : SearchProductListModuleProtocol {
    public init() {}
    public func createSearchProductListModule(text:String) -> UIViewController {
        let view = SearchProductListViewController()
        print(view)
        return view
    }
    
    
}

