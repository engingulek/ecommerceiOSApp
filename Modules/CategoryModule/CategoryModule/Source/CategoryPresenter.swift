//
//  CategoryPresenter.swift
//  CategoryModule
//
//  Created by Engin Gülek on 17.09.2024.
//

import Foundation
import UICommonKit
final class CategoryPresenter  {
   weak var view: PresenterToViewCategoryProtocol?
    private let interactor : PresenterToInteractorCategoryProtocol
    private var categories: [CategoryResult] = []
    private var subCategories : [SubCategories] = []
    init(view: PresenterToViewCategoryProtocol?,interactor:PresenterToInteractorCategoryProtocol = CategoryInteractor()) {
        self.view = view
        self.interactor = interactor
    }
    
    
}



extension CategoryPresenter : ViewToPresenterCategoryProtocol {
    

    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.prepareCollectionView()
        view?.prepareTableView()
        view?.reloadCategoryTableView()
        view?.reloadSubCategoryCollectionView()
        view?.changeTitle(title: TextTheme.categories.rawValue)
        Task {
           await fetch()
        }
        
    }
    
    func fetch() async {
        do{
           try await interactor.fetchCategories()
        }catch{
            print("Error fetch categories")
        }
        
    }
    
    
    func numberOfRowsInSection() -> Int {
        return categories.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> String {
        let category = categories[indexPath.row]
        return category.name
    }
    
    
}

extension CategoryPresenter : InteractorToPresenterCategoryProtocol {
    func sendData(categoryResult:[CategoryResult]) {
        categories = categoryResult
        view?.reloadCategoryTableView()
    }
    
    
}
