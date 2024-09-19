//
//  ProductListPresenter.swift
//  ProductListModule
//
//  Created by Engin Gülek on 19.09.2024.
//

import Foundation

final class ProductListPresenter {
    weak var view : PresenterToViewProductListProtocol?
    private let interactor : PresenterToInteractorProductListProtocol
    private let router : PresenterToRouserProductListProtocol
    
    init(view: PresenterToViewProductListProtocol?, interactor: PresenterToInteractorProductListProtocol = ProductListInteractor(), router: PresenterToRouserProductListProtocol = ProductListRouter()) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}



extension ProductListPresenter : ViewToPresenterProductListProtocol {

    func viewDidLoad() {
        view?.reloadCollectionView()
    }
    
    func getSubCategoryId(subCategoryId: Int) {
        print("Sent \(subCategoryId)")
    }
}

extension ProductListPresenter : InteractorToPresenterProductListProtocol {
    
}
