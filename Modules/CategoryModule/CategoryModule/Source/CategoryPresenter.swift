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
    private var preSelectedSubCategories : [SubCategories] =  [ .init(id: 1, name: "Pre-Selected Category", icon: "https://firebasestorage.googleapis.com/v0/b/ecommerceiosapp-f7e59.appspot.com/o/images%2Felectronics.png?alt=media&token=ef5b3f17-86e2-4be4-a69c-ae4c1d1153b8")]
    private var selectedCategoryId: Int = -1
    private let router : PresenterToRouteCategoryProtocol
    init(view: PresenterToViewCategoryProtocol?,
         interactor:PresenterToInteractorCategoryProtocol = CategoryInteractor(),
         router:PresenterToRouteCategoryProtocol = CategoryRouter() ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}



extension CategoryPresenter  {
    
    func fetch() async {
        do{
            try await interactor.fetchCategories()
        }catch{
            print("Error fetch categories")
        }
        
    }
    
}


extension CategoryPresenter : ViewToPresenterCategoryProtocol {
  
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.prepareCollectionView()
        view?.prepareTableView()
        subCategories = preSelectedSubCategories
        view?.reloadCategoryTableView()
        view?.reloadSubCategoryCollectionView()
        view?.changeTitle(title: TextTheme.categories.rawValue)
        view?.speacialViewChangeUI(
            textColor: ColorTheme.thirdLabelColor.rawValue,
            backColor: ColorTheme.primaryBackColor.rawValue)
        Task {
            await fetch()
        }
        
    }
    
    
    func numberOfRowsInSection() -> Int {
        return categories.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> (
        text:String,
        textColor:String,
        backColor:String) {
            let text:String
            let textColor:String
            let backColor:String
            let category = categories[indexPath.row]
            text = category.name
            if category.id == selectedCategoryId {
                textColor = ColorTheme.thirdLabelColor.rawValue
                backColor = ColorTheme.primaryBackColor.rawValue
            }else{
                textColor = ColorTheme.secandaryLabelColor.rawValue
                backColor = ColorTheme.secondaryBackColor.rawValue
            }
            
            return (text,textColor,backColor)
            
        }
    
    func didSelectRow(at indexPath: IndexPath) {
        
        selectedCategoryId = categories[indexPath.row].id
        view?.speacialViewChangeUI(textColor: ColorTheme.secandaryLabelColor.rawValue, backColor: ColorTheme.secondaryBackColor.rawValue)
        view?.reloadCategoryTableView()
        
        /// set subCategories
        subCategories = categories[selectedCategoryId - 1].subCategories
        view?.reloadSubCategoryCollectionView()
    }
    
    func specialViewOnTapped() {
        selectedCategoryId =  -1
        //TODO: pre-selected categories will be gone here
        subCategories = preSelectedSubCategories
        view?.speacialViewChangeUI(
            textColor: ColorTheme.thirdLabelColor.rawValue,
            backColor: ColorTheme.primaryBackColor.rawValue)
        view?.reloadCategoryTableView()
        view?.reloadSubCategoryCollectionView()
    }
    
}


extension CategoryPresenter {
    
    func numberOfItemsInSection() -> Int {
        return subCategories.count
    }
    
    func collectionViewCellForItem(at indexPath: IndexPath) -> SubCategories {
        let subCategory = subCategories[indexPath.item]
        return subCategory
    }
    func didSelectItemAt(at indexPath: IndexPath) {
        let subCategoryId = subCategories[indexPath.row].id
        router.toProductListModule(view: view, subCategoryId: subCategoryId)
    }
    
}

extension CategoryPresenter : InteractorToPresenterCategoryProtocol {
    func sendData(categoryResult:[CategoryResult]) {
        categories = categoryResult
        view?.reloadCategoryTableView()
    }
}
