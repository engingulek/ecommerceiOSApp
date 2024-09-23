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
        let interactor = ProductDetailInteractor()
        let presenter : ViewToPresenterProductDetailProtocol & InteractorToPresenterProductDetailProtocol = ProductDetailPresenter(view: view,interactor: interactor)
        view.presenter = presenter
        presenter.getProductInfo(id: id, product_id: product_id)
        interactor.presenter =  presenter
        
        return view
    }
}

extension ProductDetailRouter : PresenterToRouserProductDetailProtocol {}
