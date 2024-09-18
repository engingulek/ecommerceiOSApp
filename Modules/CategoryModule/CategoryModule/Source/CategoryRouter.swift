//
//  CategoryRouter.swift
//  CategoryModule
//
//  Created by Engin Gülek on 16.09.2024.
//

import Foundation
import UIKit
public class CategoryRouter : CategoryModuleProtocol {

    public init() {}
    
    public func createHomeModule() -> UIViewController {
        let view = CategoryViewController()
        let interactor = CategoryInteractor()
        let presenter : ViewToPresenterCategoryProtocol & InteractorToPresenterCategoryProtocol = CategoryPresenter(view: view,interactor: interactor)
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
    
    
    
}
