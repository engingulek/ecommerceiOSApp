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
    
    public func createProductListModule(subCategoryId: Int) -> UIViewController {
        let view = ProductListCollectionView()
        let interactor = ProductListInteractor()
        let presenter : ViewToPresenterProductListProtocol & InteractorToPresenterProductListProtocol = ProductListPresenter(view: view,interactor: interactor)
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.getSubCategoryId(subCategoryId: subCategoryId)
        return view
    }
}


extension ProductListRouter : PresenterToRouserProductListProtocol {
    
}



