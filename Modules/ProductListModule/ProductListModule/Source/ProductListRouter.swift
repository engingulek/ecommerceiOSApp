//
//  ProductListRouter.swift
//  ProductListModule
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation
import UIKit
import ProductDetailModule
import DependencyKits
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
    func toProductDetailModule(view:PresenterToViewProductListProtocol?,id: Int, product_id: Int) {
        @Dependency var productDetailModule : ProductDetailModuleProtocol
        let controllerView =  productDetailModule.createProductListModule(id: id, product_id: product_id)
        view?.pushViewControllerAble(controllerView, animated: true)
        
        
    }
    
    
}



