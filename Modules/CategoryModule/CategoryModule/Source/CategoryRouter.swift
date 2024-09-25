//
//  CategoryRouter.swift
//  CategoryModule
//
//  Created by Engin Gülek on 16.09.2024.
//

import Foundation
import UIKit
import DependencyKits
import ProductListModule

//MARK: CategoryModuleProtocol
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


//MARK: PresenterToRouteCategoryProtocol
extension CategoryRouter : PresenterToRouteCategoryProtocol {
  
    func toProductListModule(view:PresenterToViewCategoryProtocol?,subCategoryId: Int) {
        @Dependency var productListProtocol : ProductListModuleProtocol
        let collectionView = productListProtocol.createProductListModule(subCategoryId: subCategoryId)
        view?.pushViewControllerAble(collectionView, animated: true)
    }
    
    
}
