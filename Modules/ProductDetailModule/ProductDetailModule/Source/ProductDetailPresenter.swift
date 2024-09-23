//
//  ProductDetailPresenter.swift
//  ProductDetailModule
//
//  Created by Engin Gülek on 23.09.2024.
//

import Foundation
import UICommonKit
final class ProductDetailPresenter {
    weak var view : PresenterToViewProductDetailProtocol?
    private let interactor : PresenterToInteractorProductDetailProtocol
    private let router : PresenterToRouserProductDetailProtocol
    init(view: PresenterToViewProductDetailProtocol?, interactor: PresenterToInteractorProductDetailProtocol = ProductDetailInteractor(), router: PresenterToRouserProductDetailProtocol = ProductDetailRouter()) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}


extension ProductDetailPresenter : ViewToPresenterProductDetailProtocol {
  
    
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.prepareCollectionView()
        view?.reloadCollectionView()
        
    }
    
    func getProductInfo(id: Int, product_id: Int) {
        print("\(id) - \(product_id)")
    }
    
    
}

extension ProductDetailPresenter : InteractorToPresenterProductDetailProtocol {
    
}
